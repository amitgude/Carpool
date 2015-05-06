class Carpool < ActiveRecord::Base
	belongs_to :user
	has_many :cars
	has_many :source, :dependent => :destroy
    has_many :destination, :dependent => :destroy
    has_many :seats, :dependent => :destroy
    has_many :preferences, :dependent => :destroy
    has_many :passengers
	accepts_nested_attributes_for :source, :allow_destroy => true
	accepts_nested_attributes_for :destination, :allow_destroy => true
	accepts_nested_attributes_for :seats, :allow_destroy => true
	accepts_nested_attributes_for :preferences, :allow_destroy => true

	validates :price, :luggage_size,:other,:car_id, :presence => :true
	validates_associated :seats
	validates_associated :destination
	validates_associated :source
	
end
