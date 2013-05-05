class Vendor < ActiveRecord::Base
  
  attr_accessible :name, :address, :latitude, :longitude, :phone

  has_many :inventory_records, :dependent => :destroy
  has_many :items, :through => :inventory_records

  validates :name, :presence => true
  validates :address, :presence => true, :uniqueness => true

  geocoded_by :address
  acts_as_gmappable

   def gmaps4rails_infowindow
      "<strong>#{self.name}</strong><br>
      #{self.address}<br>
      #{self.phone}"
  end

  def gmaps4rails_title
    self.name
  end

end
