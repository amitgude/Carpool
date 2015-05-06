class Car < ActiveRecord::Base
	belongs_to :user
	belongs_to :carpool
	has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }
    validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

    validates :brand, :model, :color, :seats, :presence => :true
    											
end
