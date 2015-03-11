require "test_helper"

class SessionsControllerTest < ActionController::TestCase

  def setup
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:default]
  end

  test "should create authentication" do
    request.env["HTTP_REFERER"] = "/"
    get :create, :provider => :default
    user = User.last
    assert_equal session[:user_id], user.id
    assert_redirected_to "/"
  end

  test "should not authenticate if login fails" do
    skip
    request.env["HTTP_REFERER"] = "/"
    get :create, :provider => :default
    assert_equal nil, session[:user_id]
    assert_redirected_to "/"
  end

  test "should destroy authentication" do
    request.env["HTTP_REFERER"] = "/"
    get :create, :provider => :default
    user = User.last
    assert_equal session[:user_id], user.id

    get :destroy
    assert_equal session[:user_id], nil
    assert_redirected_to "/"
  end
end
