ENV["RAILS_ENV"] = 'test'

require 'rubygems'
require 'spork'

#
# SimpleCov configuration
#----------------------------------------------------------------------------------------------------------------------
#
require 'simplecov'
require 'simplecov-rcov'
#require 'simplecov-sublime-ruby-coverage'

class SimpleCov::Formatter::MergedFormatter
  def format(result)
     SimpleCov::Formatter::HTMLFormatter.new.format(result)
     SimpleCov::Formatter::RcovFormatter.new.format(result)
     #SimpleCov::Formatter::SublimeRubyCoverageFormatter.new.format(result)
  end
end

SimpleCov.formatter = SimpleCov::Formatter::MergedFormatter
SimpleCov.command_name "RSpec"
SimpleCov.start 'rails' do
  add_filter "/spec/"
  add_filter "/features/"
  add_filter "/lib/external/"
end


#
# Spork configuration
#----------------------------------------------------------------------------------------------------------------------
#




Spork.prefork do

  require File.expand_path("../../config/environment", __FILE__)


  require 'rspec/rails'
  require 'rspec/autorun'
  require 'database_cleaner'
  require 'webmock/rspec'

  # require 'watir-webdriver-rails'
  # require 'watir-webdriver'
  # WatirWebdriverRails.host = "localhost:3000"
  # WatirWebdriverRails.port = 3000
  # WatirWebdriverRails.close_browser_after_finish = true

  def load_seeds
    load File.join(File.dirname(__FILE__), '..', 'db', 'seeds.rb')
  end

  # Formats number values into currency string, used when comparing
  # monetary values to formatted outputs from tested methods/actions
  def currency(value)
    CurrencyFormatter.currency_padding(value)
  end

  RSpec.configure do |config|
    config.before(:suite) do
      DatabaseCleaner[:active_record].strategy = :transaction
      DatabaseCleaner.clean_with(:truncation)
    end

    config.before(:each) do
      require 'resolv'
      Resolv::DNS.any_instance.stub(:getresources).and_return(["wrongdomain.com"])

      # with_transaction_callbacks = example.options[:with_transaction_callbacks]
      # if with_transaction_callbacks
      #   DatabaseCleaner.strategy = :truncation
      # else
      #   DatabaseCleaner.strategy = :transaction
      # end
      DatabaseCleaner.start
      # SalesHistoryWorker.stub(perform_async: true)

    end

    config.after(:each) do
      DatabaseCleaner.clean
    end

    config.before(:all) do
    end

    config.infer_base_class_for_anonymous_controllers = false

    config.treat_symbols_as_metadata_keys_with_true_values = true

    config.use_transactional_fixtures = false

  end

  RspecApiDocumentation.configure do |config|
    config.docs_dir = Rails.root.join("app", "views", "pages")

    config.define_group :public do |config|
      config.docs_dir = Rails.root.join("public", "docs")
      config.url_prefix = "/docs"
    end
  end
end

Spork.each_run do

  FactoryGirl.reload

end
