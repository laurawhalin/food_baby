require 'simplecov'
SimpleCov.start 'rails'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/pride"
require "minitest/rails/capybara"

OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:default] = OmniAuth::AuthHash.new({
  :provider => 'facebook',
  :uid => '1234',
  :info => {
    :name => 'Laura Whalin',
    :email => 'laura@example.com',
    :first_name => 'Laura',
    :last_name => 'Whalin',
    :image => 'picture.jpg'},
  :credentials => { :token => '1234'}
  })

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
