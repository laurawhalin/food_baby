class RestaurantsController < ApplicationController
  respond_to :html, :json

  def show
    @restaurant = Restaurant.details(params[:id])
    respond_with @restaurant
  end

  def index
    @restaurants = Restaurant.kid_friendly(params[:kid_friendly])
    respond_with @restaurants
  end
end
