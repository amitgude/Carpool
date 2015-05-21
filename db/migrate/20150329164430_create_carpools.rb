class CreateCarpools < ActiveRecord::Migration
  def change
    create_table :carpools do |t|
      t.integer :user_id 
      t.date :journey_date
      t.time :depature_time
      t.integer :price, :limit => 2
      t.integer :luggage_size, :limit => 1
      t.text :other
      t.integer :car_id 
      t.timestamps null: false
    end
  end
end
