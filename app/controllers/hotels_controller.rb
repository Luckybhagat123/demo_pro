class HotelsController < ApplicationController
  before_action :find_location, only: [:hotels_list, :single_hotel, :hotel_rating]

  #all hotels list based on explore location
  def hotels_list
    render json: {data: HotelSerializer.new(@location.hotels)}, status: :ok
  end


  #single hotel details based on explore location
  def single_hotel
    render json: {data: HotelSerializer.new(@location.hotels.find_by(id: params[:id]))}
  end

  private
  def find_location
    @location = ExploreLocation.find_by(id: params[:explore_location_id])
  end

  def hotel_params
    params.permit(:name, :desciption, :address)
  end
end
