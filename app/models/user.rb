class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation

  has_one :list

  validates_confirmation_of :password
  validates :password, :presence => 'true'
  validates :email, :presence => 'true', :uniqueness => 'true'
  validates :first_name, :presence => 'true'
  validates :last_name, :presence => 'true'

end
