require 'test_helper'

class RegistrationEmailTest < ActionMailer::TestCase
  test "it sends email" do
    email_address = "foo@bar.com"
    name = "Lucy"
    email = RegistrationEmail.send_welcome_email(email_address, name).deliver_now

    assert_equal ['laurawhalin@gmail.com'], email.from
    assert_equal ['foo@bar.com'], email.to
    assert_equal "Hello Lucy! You are registered for Food Baby!", email.body.to_s
  end
end
