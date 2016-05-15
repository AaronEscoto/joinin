class Location < ActiveRecord::Base
	validates :title, :street, :city, :state, :zip, :presence => true
end
