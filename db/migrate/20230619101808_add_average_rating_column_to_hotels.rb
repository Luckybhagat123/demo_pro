class AddAverageRatingColumnToHotels < ActiveRecord::Migration[7.0]
  def change
    add_column :hotels, :average_rating, :float
    add_column :restaurants, :average_rating, :float
  end
end
