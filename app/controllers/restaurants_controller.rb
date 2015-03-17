class RestaurantsController < ApplicationController
  respond_to :html, :json

  before_action :set_location

  after_filter do
    puts response.body
  end

  def show
    @restaurant = Restaurant.find(params[:id])

  end

  def index
    @restaurants = Restaurant.kid_friendly?(params[:kid_friendly], set_location)
    respond_with @restaurants
  end

  def create
    require 'pry' ; binding.pry
    latitude = params[:latitude]
    longitude = params[:longitude]
    session[:location] = [latitude, longitude]
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(coordinate_attributes: [:latitude, :longitude])
  end

  def set_location
    session[:location]
  end
end
