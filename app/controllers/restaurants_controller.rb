class RestaurantsController < ApplicationController
  respond_to :html, :json

  after_filter do
    puts response.body
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def index
    @restaurants = Restaurant.kid_friendly?(params[:kid_friendly])
    respond_with @restaurants
  end
end
