ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

module AuthenticationHelper
  def login_as(user)
    post login_url, params: { user: { email: user.email, password: default_password } }
  end

  def default_password_digest
    BCrypt::Password.create(default_password)
  end

  def default_password
    "hunter2"
  end
end

class ActionDispatch::IntegrationTest
  include AuthenticationHelper
end

class ActiveSupport::TestCase
  include AuthenticationHelper

  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

# Enable the use of default_password in test fixtures
ActiveRecord::FixtureSet.context_class.send :include, AuthenticationHelper
