require "test_helper"

class RestaurantTest < ActiveSupport::TestCase

  test "can find kid-friendly restaurants" do
    query           = "true"
    location        = [39.7391500, -104.9847000]
    restaurants     = Restaurant.kid_friendly(query)

    first_restaurant = restaurants.first

    assert_equal 2, restaurants.count
    assert_equal "Steuben's", first_restaurant['name']
    assert_equal true, first_restaurant['kids_goodfor']
  end

  test "can find non-kid restaurants" do
    query           = "false"
    location        = [39.7391500, -104.9847000]
    restaurants     = Restaurant.kid_friendly(query)

    first_restaurant = restaurants.first

    assert_equal 2, restaurants.count
    assert_equal "X Bar", first_restaurant['name']
    assert_equal false, first_restaurant['kids_goodfor']
  end

  test "can view restaurants without a query" do
    query = nil
    location        = [39.7391500, -104.9847000]
    restaurants     = Restaurant.kid_friendly(query)

    first_restaurant = restaurants.first

    assert_equal 2, restaurants.count
    assert_equal "X Bar", first_restaurant['name']
  end

  test "can view details for a single restaurant" do
    factual_id = "2561940e-d371-4dfa-8df6-3b797700ebaf"
    restaurant = Restaurant.details(factual_id)

    assert_equal "Steuben's", restaurant['name']
  end
end
