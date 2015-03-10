class RestaurantsController < ApplicationController
  def show
  end

  def index
    @restaurants = Restaurant.kid_type(params[:format])
    @hash = Gmaps4rails.build_markers(@restaurants) do |restaurant, marker|
      marker.lat restaurant.latitude
      marker.lng restaurant.longitude
    end
  end
end
