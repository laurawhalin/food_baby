require "test_helper"

class UserTest < ActiveSupport::TestCase

  def valid_attributes
    {
      name:      "Laura W.",
      email:     "laurawhalin@example.com",
      token:     "FAKEFAKEFAKElksjdfalkvnaldirueaijo2948029394879sidFAKEFAKEFAKE",
      uid:       "2934989487982394892349",
      image_url: "http://graph.facebook.com/2934989487982394892349/picture/laura.jpg",
    }
  end

  def user
    @user ||= User.new(valid_attributes)
  end

  test "it is valid" do
    assert user.valid?
  end

  should validate_presence_of(:name)
  should validate_presence_of(:email)
  should validate_presence_of(:token)
  should validate_presence_of(:uid)
  should validate_presence_of(:image_url)

  should validate_uniqueness_of(:email)
  should allow_value('laura_w@foo.com', 'laura.W@foo.com').
    for(:email)
  should_not allow_value('laura_w').for(:email)
  should_not allow_value('laura_w@example').for(:email)

  test "login should create a user" do
    auth = OmniAuth.config.mock_auth[:default]
    User.find_or_create_from_auth(auth)
    user = User.last
    username = "#{auth.info.first_name} #{auth.info.last_name[0]}."
    assert_equal user.name, username
  end

  # test "unsuccessful login should not create a user" do
  #   # request.env["HTTP_REFERER"] = "/"
  #   auth = OmniAuth.config.mock_auth[:invalid]
  #   require 'pry' ; binding.pry
  #   User.find_or_create_from_auth(auth)
  #   assert_equal "Unable to log in.", body.includes
  #   refute_equal user.name, nil
  # end
end
