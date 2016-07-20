class AddUserColumnToTrails < ActiveRecord::Migration
  def change
    add_column :trails, :user_id, :integer, null: false
  end
end
