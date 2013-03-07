
# bundler bootstrap
require 'bundler/capistrano'

set :rails_env, ENV['RAILS_ENV'] || "staging"
set :application, ENV['HOST']
set :deploy_to, "/var/www/#{application}"

# server details
default_run_options[:pty] = true
ssh_options[:forward_agent] = false
set :deploy_via, :remote_cache
set :copy_exclude, %w(.git spec)
set :user, "passenger"
set :use_sudo, false

set :scm, :git
set :scm_username, ENV['CAP_USER']
set :repository, ENV['SCM']

if variables.include?(:branch_name)
  set :branch, "#{branch_name}"
else
  set :branch, "master"
end
set :git_enable_submodules, 1

namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

role :web, "#{application}"
role :app, "#{application}"
role :db,  "#{application}", :primary => true

before "deploy:assets:precompile", "db:setup", "devise:cassetup"
# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

namespace :db do
  task :setup do
    template = File.read("config/deploy/database.yml.erb")
    config = ERB.new(template).result(binding)
    put config, "#{release_path}/config/database.yml"
  end
end

namespace :devise do
  task :cassetup do
    template = File.read("config/deploy/devise_cas_server.rb.erb")
    config = ERB.new(template).result(binding)
    put config, "#{release_path}/config/initializers/devise_cas_server.rb"
  end
end
