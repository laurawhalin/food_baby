class RestaurantsController < ApplicationController
  respond_to :html, :json

  after_filter do
    puts response.body
  end

  def show
    @restaurant = Restaurant.find(params[:id])

  end

  def index
    # respond_to do |format|
    #   format.json { render json: }
    # end
    @restaurants = Restaurant.kid_friendly?(params[:kid_friendly], location)
    respond_with @restaurants
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(coordinate_attributes: [:latitude, :longitude])
  end
end
