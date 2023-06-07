class RestaurantsController < ApplicationController
  before_action :find_location, only: [:restaurants_list, :single_restaurant]
 
  #restaurants list based on explore location
  def restaurants_list
    render json: {data: RestaurantSerializer.new(location.restaurants)}
  end


  #single restaurant details based on explore location
  def single_restaurant
    render json: {data: RestaurantSerializer.new(location.restaurants.find_by(restaurant_id: params[:restaurant_id]))}
  end

  private
  def find_location
    location = ExploreLocation.find_by(id: params[:id])
  end

  def restaurant_params
    params.permit(:name, :address)
  end
end
