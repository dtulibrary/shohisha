source 'https://rubygems.org'

gem 'rails', '~> 3.2.0'
gem 'railties'
gem 'jquery-rails', '~> 2.3.0'
gem 'activeadmin'
gem 'devise_cas_authenticatable'
gem 'json'
gem 'httparty'

# Deploy with Capistrano
gem 'capistrano'

group :assets do
  gem 'sass-rails',   '~> 3.2'
  gem 'coffee-rails', '~> 3.2'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
  gem 'turbo-sprockets-rails3'
end

group :test do
  gem 'simplecov', :require => false
  gem 'simplecov-html', :require => false
  gem 'simplecov-rcov', :require => false
  gem 'mocha', :require => false
  gem 'factory_girl_rails'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'sqlite3'
  # Static analysis for security vulnerabilities.
  gem 'brakeman'
end

group :development do
  gem 'rails_best_practices'
  gem 'debugger'
end

group :staging, :production do
  gem 'pg'
end
