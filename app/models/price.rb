class Price < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :item
  attr_accessible :price_cents

  monetize :price_cents, :allow_nil => false, :numericality => { :greater_than_or_equal_to => 0}

end