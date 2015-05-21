class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.integer :carpool_id
      t.string :destination, :limit => 50
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
