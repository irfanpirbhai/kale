class List < ActiveRecord::Base
  
  attr_accessible :user

  belongs_to :user
  has_and_belongs_to_many :items
  
end
