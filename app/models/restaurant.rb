class Restaurant < ActiveRecord::Base
  validates :name, :longitude, :latitude, :address, :locality,
            :region, :postcode, :phone_number, presence: true

  def self.kid_type(type)
    if type == "kids"
      @restaurants = where(kid_friendly: true)
    elsif type == "no-kids"
      @restaurants = where(kid_friendly: false)
    else
      @restaurants = all
    end
  end
end
