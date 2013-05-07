collection @vendors

attributes :name, :address, :phone, :url, :latitude, :longitude
node(:distance) { |vendor| vendor.distance_from(@inputted_location).round(1) }