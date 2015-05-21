class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.integer :carpool_id
      t.string :music, :limit => 10
      t.string :pets, :limit => 10
      t.string :smoking, :limit => 10
      t.boolean :ladies
      t.string :food, :limit => 10
      t.timestamps null: false
    end
  end
end
