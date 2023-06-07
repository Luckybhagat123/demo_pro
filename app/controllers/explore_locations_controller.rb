class ExploreLocationsController < ApplicationController
  
  #List all explore locations
  def index
    explore = ExploreLocation.all
    render json: {data: ExploreLocationSerializer.new(explore)}
  end

  #show single location details
  def show
    explore = ExploreLocation.find_by(id: params[:id])
    render json: {data: ExploreLocationSerializer.new(explore)}
  end

  private
  def explore_loc_params
    params.permit(:name, :city_name, :desciption)
  end
end
