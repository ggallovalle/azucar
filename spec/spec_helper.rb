require "bundler/setup"
require "azucar"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
    # see https://relishapp.com/rspec/rspec-expectations/v/3-10/docs/built-in-matchers/predicate-matchers#the-config-%60strict-predicate-matchers%60-impacts-matching-of-results-other-than-%60true%60-and-%60false%60
    c.strict_predicate_matchers = true
  end
end
