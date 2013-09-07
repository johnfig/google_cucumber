require 'simplecov'
SimpleCov.start 'rails'
SimpleCov.coverage_dir 'coverage/cucumber'

require 'spork'

#
# Helper Methods
#


# Initilize Spork and configure Capybara
#-----------------------------------------------------------------------------------------------
#
Spork.prefork do
  ENV["RAILS_ENV"] ||= "test"

  require 'cucumber/rails'
  require 'cucumber/rails/rspec'
  require 'cucumber/websteps'
  require 'capybara-screenshot/cucumber'
  require 'factory_girl'
  require 'webmock/cucumber'
  require 'cucumber/rspec/doubles'
  require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')
  require File.expand_path(File.dirname(__FILE__) + '/../../features/support/cucumber_helper_methods')

  WebMock.allow_net_connect!
  Cucumber::Rails::World.use_transactional_fixtures = false

  # Remove/comment out the lines below if your app doesn't have a database.
  # For some databases (like MongoDB and CouchDB) you may need to use :truncation instead.
  begin
    require 'database_cleaner'
    require 'database_cleaner/cucumber'

    DatabaseCleaner.strategy = :truncation
  rescue NameError
    raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
  end

  Before do
    DatabaseCleaner.clean
  end

  Before do |scenario|
    DatabaseCleaner.start
  end

  After do |scenario|
    DatabaseCleaner.clean
  end

  # You may also want to configure DatabaseCleaner to use different strategies for certain features and scenarios.
  # See the DatabaseCleaner documentation for details. Example:
  #
  #   Before('@no-txn,@selenium,@culerity,@celerity,@javascript') do
  #     # { :except => [:widgets] } may not do what you expect here
  #     # as tCucumber::Rails::Database.javascript_strategy overrides
  #     # this setting.
  #     DatabaseCleaner.strategy = :truncation
  #   end
  #
  #   Before('~@no-txn', '~@selenium', '~@culerity', '~@celerity', '~@javascript') do
  #     DatabaseCleaner.strategy = :transaction
  #   end
  #

  # Possible values are :truncation and :transaction
  # The :transaction strategy is faster, but might give you threading problems.
  # See https://github.com/cucumber/cucumber-rails/blob/master/features/choose_javascript_database_strategy.feature
  Cucumber::Rails::Database.javascript_strategy = :truncation

  World(FactoryGirl::Syntax::Methods)
  World(CucumberHelperMethods)

  # Profiling code to determine what to preload.
  # module Kernel
  #   def require_with_trace(*args)
  #     start = Time.now.to_f
  #     @indent ||= 0
  #     @indent += 2
  #     require_without_trace(*args)
  #     @indent -= 2
  #     Kernel::puts "#{' '*@indent}#{((Time.now.to_f - start)*1000).to_i} #{args[0]}"
  #   end
  #   alias_method_chain :require, :trace
  # end
  FactoryGirl.reload
end

Spork.each_run do

  require 'cucumber/rails/world'

  # Capybara defaults to XPath selectors rather than Webrat's default of CSS3. In
  # order to ease the transition to Capybara we set the default here. If you'd
  # prefer to use XPath just remove this line and adjust any selectors in your
  # steps to use the XPath syntax.
  Capybara.default_selector = :css

  # Comment this out if you want brower interactive testing
  Capybara.javascript_driver = :webkit

  # Default wait time to make ajax calls pass (seconds)
  Capybara.default_wait_time = 5

  # Capybara.app_host = "https://matrix.gopago.com"
  Capybara.default_driver = :selenium

  # # By default, any exception happening in your Rails application will bubble up
  # # to Cucumber so that your scenario will fail. This is a different from how 
  # your application behaves in the production environment, where an error page will 
  # be rendered instead.
  #
  # Sometimes we want to override this default behaviour and allow Rails to rescue
  # exceptions and display an error page (just like when the app is running in production).
  # Typical scenarios where you want to do this is when you test your error pages.
  # There are two ways to allow Rails to rescue exceptions:
  #
  # 1) Tag your scenario (or feature) with @allow-rescue
  #
  # 2) Set the value below to true. Beware that doing this globally is not
  # recommended as it will mask a lot of errors for you!
  #
  ActionController::Base.allow_rescue = false

  FactoryGirl.reload
end

