class Item < ActiveRecord::Base
  attr_accessible :name
  
  has_many :prices, :dependent => :destroy
  has_many :vendors, :through => :prices

  validates :name, :presence => true

end
