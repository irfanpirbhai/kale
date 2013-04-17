# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Item.destroy_all
Vendor.destroy_all
InventoryRecord.destroy_all

vendors = [
  Vendor.create!(name: "Karma Coop", 
                 address: "39 Palmerston Ave, Toronto ON, M6G 2R3", 
                 phone: "(416) 534-1470"),

  Vendor.create!(name: "Herbs & Nutrition", 
                 address: "572 Bloor St W, Toronto ON, M6G 1K1", 
                 phone: "(647) 348-8064"),

  Vendor.create!(name: "Fiesta Farms", 
                 address: "200 Christie St, Toronto, M6G 3B6", 
                 phone: "(416) 537-1235")
]

item_names = [
  "Kale (organic)",
  "Brown Rice Cakes (organic)",
  "Pineapple Juice (organic)",
  "Granny Smith Apples (organic)",
  "Himalayan Sea Salt (organic)",
  "Goat Yoghurt (organic)",
  "Spinach (organic)",
  "Potatoes (3lbs bag)",
  "Gluten-free Oatmeal (3 pack)",
  "Koyo Wheat-Free Tamari",
  "Chard (organic)",
  "Thai Kitchen Coconut Milk (can)",
  "La Soyarie Extra Firm Tofu"
]

items = item_names.map {|name| Item.create!(name: name)}


vendors.each do |vendor|
  items.each {|item| vendor.inventory_records.create!(:price => rand(0.10..10), :item => item) }
end

