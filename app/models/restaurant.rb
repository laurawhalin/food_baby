class Restaurant < ActiveRecord::Base
  validates :name, :longitude, :latitude, :address, :locality,
            :region, :postcode, :phone_number, presence: true

  def self.kid_friendly?(query)
    if query
      @restaurants = where(kid_friendly: query)
    else
      @restaurants = all
    end
  end
end
