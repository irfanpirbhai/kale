class Item < ActiveRecord::Base
  
  attr_accessible :name, :id
  
  has_many :inventory_records, :dependent => :destroy
  has_many :vendors, :through => :inventory_records
  has_and_belongs_to_many :lists

  validates :name, :presence => true, :uniqueness => true

end
