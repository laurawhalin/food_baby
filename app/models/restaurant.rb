class Restaurant < ActiveRecord::Base
  validates :name, :longitude, :latitude, :address, :locality,
            :region, :postcode, :phone_number, presence: true
end
