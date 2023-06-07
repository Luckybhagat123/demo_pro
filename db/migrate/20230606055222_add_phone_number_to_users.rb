class AddPhoneNumberToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :phone_number, :string
    add_column :users, :activated, :boolean
    add_column :users, :password_digest, :string
  end
end
