class Vendor < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude, :name, :phone
end
