class CreatePassengers < ActiveRecord::Migration
  def change
    create_table :passengers do |t|
      t.integer :carpool_id
      t.integer :passenger

      t.timestamps null: false
    end
  end
end
