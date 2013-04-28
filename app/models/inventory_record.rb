class InventoryRecord < ActiveRecord::Base
  
  attr_accessible :price_cents, :price, :vendor, :item, :updated_at

  belongs_to :vendor
  belongs_to :item
  has_many :list_items
  
  monetize :price_cents, :allow_nil => false, :numericality => { :greater_than_or_equal_to => 0}

  validates :vendor_id, :item_id, :price_cents, :presence => true
  validates :item_id, :uniqueness => { :scope => :vendor_id, :message => "should belong to vendor only once" }    
end