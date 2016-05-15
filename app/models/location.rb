class Location < ActiveRecord::Base
	validates :title, :street, :city, :state, :zip, :presence => true
	has_many :events
end
