require "test_helper"

class UnauthorizedUserTest < Capybara::Rails::TestCase

  test "user can view homepage" do
    visit root_path
    assert_content page, "Food"
    assert_content page, "Eat with Kids"
    assert_content page, "Eat without Kids"
  end

  test "user can visit results page" do
    visit root_path
    click_link_or_button("Eat with Kids")
    assert_equal current_path, restaurants_path
  end
end
