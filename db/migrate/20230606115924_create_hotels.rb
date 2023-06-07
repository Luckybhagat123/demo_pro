class CreateHotels < ActiveRecord::Migration[7.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.text :description
      t.text :address

      t.timestamps
    end
  end
end
