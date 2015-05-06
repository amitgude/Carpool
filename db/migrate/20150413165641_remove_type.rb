class RemoveType < ActiveRecord::Migration
  def change
  	remove_column("carpools","type")
  end
end
