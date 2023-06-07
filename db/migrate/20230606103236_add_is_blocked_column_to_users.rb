class AddIsBlockedColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_blocked, :boolean, default: :true
  end
end
