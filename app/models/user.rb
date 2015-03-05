class User < ActiveRecord::Base

  def self.find_or_create_from_auth(auth)
    user = User.find_or_create_by(uid: auth.uid)

    user.email = auth.info.email
    user.name = auth.user_name
    require 'pry' ; binding.pry
    user.image_url = auth.info.image
    user.token = auth.credentials.token
    user.save

    user
  end

  def user_name
    auth.info.first_name + auth.info.last_name[0] + "."
  end
end
