require "test_helper"

class UnauthorizedUserTest < Capybara::Rails::TestCase

  test "user can view homepage" do
    visit root_path
    assert_content page, "Eat with Kids"
    assert_content page, "Eat without Kids"
  end
end
