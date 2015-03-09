require "test_helper"

class RestaurantTest < ActiveSupport::TestCase

  def valid_attributes
    {
      name:         "Pizza Place",
      latitude:     "-46.9837498",
      longitude:    "37.28379288",
      kid_friendly: true,
      kids_menu:    true,
      address:      "400 Main Street",
      locality:     "Denver",
      region:       "CO",
      postcode:     "80202",
      phone_number: "(303) 555-7777",
      website:      "pizzaplace.com",
      cuisine:      "Italian"
    }
  end

  def restaurant
    @restaurant ||= Restaurant.new(valid_attributes)
  end

  def test_valid
    assert restaurant.valid?
  end

  should validate_presence_of(:name)
  should validate_presence_of(:latitude)
  should validate_presence_of(:longitude)
  should validate_presence_of(:address)
  should validate_presence_of(:locality)
  should validate_presence_of(:region)
  should validate_presence_of(:postcode)
  should validate_presence_of(:phone_number)

end
