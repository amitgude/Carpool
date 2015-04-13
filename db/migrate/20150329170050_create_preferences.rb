class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.integer :carpool_id
      t.string :music
      t.string :pets
      t.string :smoking
      t.boolean :ladies
      t.string :food
      t.timestamps null: false
    end
  end
end
