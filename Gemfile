source 'https://rubygems.org'

gem 'rails'
gem 'railties'
gem 'jquery-rails'
gem 'activeadmin'
gem 'devise_cas_authenticatable'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'json'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :test do
  gem 'simplecov', :require => false
  gem 'simplecov-html', :require => false
  gem 'simplecov-rcov', :require => false
  gem 'mocha', :require => false
  gem 'factory_girl_rails'
  gem 'database_cleaner'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'sqlite3'
  # Static analysis for security vulnerabilities.
  gem 'brakeman', :require => false
end

group :development do
  gem 'rails_best_practices'
  gem 'debugger'
end

group :staging, :production do
  gem 'pg'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server

# Deploy with Capistrano
gem 'capistrano'

gem 'httparty'
