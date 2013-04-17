class List < ActiveRecord::Base
  
  attr_accessible :userI

  belongs_to :user
  has_and_belongs_to_many :items
  
end
