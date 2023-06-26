class AddHotelRefToExploreLocations < ActiveRecord::Migration[7.0]
  def change
    # add_reference :hotels, :explore_location, foreign_key: true
     add_reference :restaurants, :explore_location, foreign_key: true
  end
end
