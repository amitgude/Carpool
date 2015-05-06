class Destination < ActiveRecord::Base
	belongs_to :carpool

	geocoded_by :destination
	after_validation :geocode

	validates :destination, :presence => :true
end
