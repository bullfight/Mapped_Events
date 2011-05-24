class Venue < ActiveRecord::Base
  attr_accessible :name, :description, :street_address, :city, :postcode, :country, :latitude, :longitude
end
