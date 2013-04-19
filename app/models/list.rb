class List < ActiveRecord::Base
  
  attr_accessible :user, :item

  belongs_to :user
  has_and_belongs_to_many :items, :before_add => :validates_item
  
  validates :user_id, :presence => 'true', :uniqueness => 'true'

  def validates_item(item)
    raise ActiveRecord::Rollback if self.items.include?(item)
  end

end