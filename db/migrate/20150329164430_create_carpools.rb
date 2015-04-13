class CreateCarpools < ActiveRecord::Migration
  def change
    create_table :carpools do |t|
      t.integer :user_id
      t.string :type
      t.date :journey_date
      t.time :depature_time
      t.integer :price
      t.integer :luggage_size
      t.text :other
      t.integer :car_id
      t.timestamps null: false
    end
  end
end
