class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :user_id 
      t.string :brand, :limit => 20
      t.string :model, :limit => 20
      t.string :color, :limit => 20
      t.integer :seats , :limit => 1

      t.timestamps null: false
    end
  end
end
