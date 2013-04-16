class Vendor < ActiveRecord::Base
  attr_accessible :name, :address, :latitude, :longitude, :phone

  geocoded_by :address
  after_validation :geocode  

  validates :name, :presence => true
  
end
