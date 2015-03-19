require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase

  test "can get kid-friendly restaurants" do
    get :index, format: :json,  kid_friendly: "true"

    restaurants = JSON.parse(response.body)

    assert_response :success
    assert_equal "Steuben's", restaurants.first['name']
    refute_equal "Regal Denver Pavillions 15", restaurants.last['name']
    refute_equal "X Bar", restaurants.last['name']
  end

  test "can get non-kid restaurants" do
    get :index, format: :json,  kid_friendly: "false"

    restaurants = JSON.parse(response.body)

    assert_response :success
    assert_equal "X Bar", restaurants.first['name']
    refute_equal "Steuben's", restaurants.last['name']
  end

  test "can get details for a single restaurant" do
    get :show, format: :json, id: "2561940e-d371-4dfa-8df6-3b797700ebaf"

    restaurant = JSON.parse(response.body)

    assert_response :success
    assert_equal "Steuben's", restaurant['name']
  end
end
