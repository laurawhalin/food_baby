class RestaurantsController < ApplicationController
  def show
  end

  def index
    if params[:format] == "kids"
      @restaurants = Restaurant.where(kid_friendly: true)
    elsif params[:format] == "no-kids"
      @restaurants = Restaurant.where(kid_friendly: false)
    else
      @restaurants = Restaurant.all
    end
    @hash = Gmaps4rails.build_markers(@restaurants) do |restaurant, marker|
      marker.lat restaurant.latitude
      marker.lng restaurant.longitude
    end
  end
end
