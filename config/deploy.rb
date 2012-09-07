require "rvm/capistrano"

set :rvm_ruby_string, '1.9.3-p194'
set :rvm_type, :system

# bundler bootstrap
require 'bundler/capistrano'

set :application, "#{ENV['HOST']}"
set :deploy_to, "/var/www/#{ENV['HOST']}"

# server details
default_run_options[:pty] = true
ssh_options[:forward_agent] = false
set :deploy_via, :remote_cache
set :user, "passenger"
set :use_sudo, false

set :scm, :git
set :scm_username, "#{ENV['CAP_USER']}"
set :repository, "#{ENV['SCM']}"

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

role :web, "#{ENV['HOST']}"
role :app, "#{ENV['HOST']}"
role :db,  "#{ENV['HOST']}", :primary => true

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

namespace :db do
  task :setup do
    template = File.read("config/deploy/database.yml.erb")
    config = ERB.new(template).result(binding)
    put config, "#{release_path}/config/database.yml"
  end
end

before "deploy:migrate", "db:setup"
