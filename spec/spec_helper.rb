require_relative 'support/controller_helpers'
require 'devise'
require 'capybara/rspec'

RSpec.configure do |config|
  config.include Capybara::DSL, :type => :request

  config.include ControllerHelpers, type: :controller
  Warden.test_mode!

  config.after do
    Warden.test_reset!
  end
end
