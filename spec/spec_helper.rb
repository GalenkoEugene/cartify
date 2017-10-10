require 'capybara/rspec'
require 'capybara-webkit'
require 'capybara/webkit/matchers'
require 'transactional_capybara/rspec'
require 'factory_girl_rails'
require 'database_cleaner'
Capybara.javascript_driver = :webkit
Capybara.default_max_wait_time = 5
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.default_formatter = 'doc' if config.files_to_run.one?
  config.include FactoryGirl::Syntax::Methods
  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) { DatabaseCleaner.start }
  config.after(:each) { DatabaseCleaner.clean }
end
