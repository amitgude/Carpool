class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.integer :user_id
      t.text :message

      t.timestamps null: false
    end
  end
end
