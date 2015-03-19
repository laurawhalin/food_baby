require 'test_helper'

class NewUserReportTest < ActiveJob::TestCase
  test "a daily email report is sent" do
    email = NewUserReport.perform_now()
    assert_equal "<p>Here are the new users that registered for Food Baby in the last 24 hours:</p>\n", email.body.to_s
  end
end
