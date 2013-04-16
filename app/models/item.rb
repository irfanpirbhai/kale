class Item < ActiveRecord::Base
  attr_accessible :name
  
  has_many :inventory_records, :dependent => :destroy
  has_many :vendors, :through => :inventory_records

  validates :name, :presence => true

end
