class Source < ActiveRecord::Base
	belongs_to :carpool
    
	geocoded_by :source
	after_validation :geocode

	validates :source, :presence => :true
end
