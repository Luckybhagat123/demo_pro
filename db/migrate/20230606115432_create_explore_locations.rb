class CreateExploreLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :explore_locations do |t|
      t.string :title
      t.string :city_name
      t.text :desciption

      t.timestamps
    end
  end
end
