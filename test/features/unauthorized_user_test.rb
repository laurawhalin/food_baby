require "test_helper"

class UnauthorizedUserTest < Capybara::Rails::TestCase

  test "user can view homepage" do
    visit root_path
    assert_content page, "Food Baby"
    assert_content page, "Eat With Kids!"
    assert_content page, "Eat Without Kids!"
  end
end
