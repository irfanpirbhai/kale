class InventoryRecord < ActiveRecord::Base
  
  attr_accessible :price_cents, :price, :vendor, :item, :updated_at

  belongs_to :vendor
  belongs_to :item
  
  monetize :price_cents, :allow_nil => false, :numericality => { :greater_than_or_equal_to => 0}
end