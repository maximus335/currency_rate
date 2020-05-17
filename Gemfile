# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3'

gem 'devise'
gem 'dotenv'
gem 'foreman'
gem 'http'
gem 'pg'
gem 'puma', '~> 4.1'
gem 'redis'
gem 'sidekiq'
gem 'whenever'

# Frontend
gem 'bootstrap-sass'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.47'
gem 'coffee-rails'
gem 'font-awesome-rails'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'momentjs-rails', '>= 2.9.0'
gem 'sass-rails', '>= 6'
gem 'simple_form'
gem 'slim'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rails-controller-testing'
  gem 'rspec-rails'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'fakeredis'
  gem 'rspec-sidekiq'
  gem 'webmock'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
