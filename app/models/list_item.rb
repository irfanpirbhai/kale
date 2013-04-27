class ListItem < ActiveRecord::Base

  attr_accessible :item

  belongs_to :list
  belongs_to :item
  belongs_to :inventory_record
  
  validates :list_id, :item_id, :presence => 'true'
  validates :item_id, :uniqueness => { :scope => :list_id,
    :message => "should be on list only once" }
end
