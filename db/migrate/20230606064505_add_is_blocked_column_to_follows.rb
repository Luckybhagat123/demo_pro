class AddIsBlockedColumnToFollows < ActiveRecord::Migration[7.0]
  def change
    add_column :follows, :is_blocked, :boolean, default: false
  end
end
