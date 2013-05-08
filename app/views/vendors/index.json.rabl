collection @vendors

attributes :name, :address, :phone, :url, :latitude, :longitude
node(:distance) { |vendor| vendor.distance_from(@inputted_location).round(1) }

# node @inputted_location do |i|
#   attributes :inputted_location =>  @inputted_location[i]
# end

# child(@inputted_location)

node(:inputted_location_lat) { @inputted_location[0] }
node(:inputted_location_lng) { @inputted_location[1] }

# glue @inputted_location do
#   attributes :inputted_location =>  @inputted_location[i]
# end

# glue @vendors do
#   attributes :id => :vendor_id
# end