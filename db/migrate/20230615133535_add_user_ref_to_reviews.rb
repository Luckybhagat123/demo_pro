class AddUserRefToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :hotel, foreign_key: true
    add_reference :reviews, :restaurant, foreign_key: true 
    add_reference :reviews, :user, foreign_key: true
    add_reference :hotels, :user, foreign_key: true
    add_reference :restaurants, :user, foreign_key: true
  end
end
