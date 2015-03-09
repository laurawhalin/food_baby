class User < ActiveRecord::Base
  validates :email, :name, :image_url, :token, :uid, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  def self.find_or_create_from_auth(auth)
    user = User.find_or_create_by(uid: auth.uid)

    user.email = auth.info.email
    user.name = self.user_name(auth)
    user.image_url = auth.info.image
    user.token = auth.credentials.token
    user.save

    user
  end

  def self.user_name(auth)
    "#{auth.info.first_name} #{auth.info.last_name[0]}."
  end
end
