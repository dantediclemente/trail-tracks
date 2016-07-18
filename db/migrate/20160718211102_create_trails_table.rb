class CreateTrailsTable < ActiveRecord::Migration
  def change
    create_table :trails do |t|
      t.string :name, null: false
      t.string :park_name, null: false
      t.decimal :lat, {:precision=>10, :scale=>6}
      t.decimal :lng, {:precision=>10, :scale=>6}
      t.float :distance, null: false
      t.date :date_hiked, null: false
      t.integer :rating
      t.boolean :hiked, null: false
      t.float :duration
      t.text :description
    end
  end
end
