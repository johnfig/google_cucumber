source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem 'sqlite3'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'debugger' unless ENV['RM_INFO']
  gem 'rspec-rails'
  gem 'jasmine-rails'
  gem 'rspec_spinner'
  gem 'database_cleaner'
  gem 'faker'
  gem 'headless'
  gem 'awesome_print'
  gem 'rest-client'
  gem 'guard'
  gem 'spork'
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'guard-cucumber'
  gem 'simplecov', :require => false
  gem 'simplecov-rcov', :require => false
  gem 'simplecov-sublime-ruby-coverage', :require => false
  gem 'factory_girl_rails'
  gem 'nyan-cat-formatter'
  gem 'timecop'
  gem 'webmock', require: false
  gem "selenium-webdriver", "~> 2.35.1"
end

group :test do
  gem 'cucumber'
  gem 'cucumber-rails', :require => false
  gem 'cucumber-websteps'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'capybara-screenshot'
  gem 'bourne', '>= 1.4.0'
  gem 'shoulda-matchers', '>= 1.5.2'
  gem 'ci_reporter'
  gem 'rspec_api_documentation'
end

gem 'jquery-rails'
