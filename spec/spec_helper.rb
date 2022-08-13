# frozen_string_literal: true

require 'rspec/viewcomponent'
require 'view_component'
require 'view_component/test_helpers'
require 'capybara/rspec'
require 'combustion'
require 'action_controller'
require 'action_controller/test_case'

Combustion.initialize! :action_controller, :action_view

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include ViewComponent::TestHelpers, type: :component
  config.include Capybara::RSpecMatchers, type: :component
  # config.include RSpec::ViewComponent::Context, type: :component
end
