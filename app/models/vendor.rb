class Vendor < ActiveRecord::Base
  
  attr_accessible :name, :address, :latitude, :longitude, :phone

  has_many :inventory_records, :dependent => :destroy
  has_many :items, :through => :inventory_records

  validates :name, :presence => true
  validates :address, :presence => true, :uniqueness => true

  geocoded_by :address
  after_validation :geocode  

end
