class List < ActiveRecord::Base
  
  attr_accessible :user, :item

  belongs_to :user
  has_many :list_items

  validates :user_id, :presence => 'true', :uniqueness => 'true'

end