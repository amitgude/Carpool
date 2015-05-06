class Seat < ActiveRecord::Base
	belongs_to :carpool

	validates :seats, :presence => :true
end
