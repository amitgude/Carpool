class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.integer :user_id
      t.text :message, :limit => 144

      t.timestamps null: false
    end
  end
end
