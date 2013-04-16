class Vendor < ActiveRecord::Base
  attr_accessible :name, :address, :latitude, :longitude, :phone

  has_many :prices, :dependent => :destroy
  has_many :items, :through => :prices

  validates :name, :presence => true

  geocoded_by :address
  after_validation :geocode  

end
