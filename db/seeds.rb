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

vendor1 = Vendor.create!(name: "Karma Coop", 
                    address: "39 Palmerston Ave, Toronto ON, M6G 2R3", 
                    phone: "(416) 534-1470")

vendor2 = Vendor.create!(name: "Herbs & Nutrition", 
                    address: "572 Bloor St W, Toronto ON, M6G 1K1", 
                    phone: "(647) 348-8064")

vendor3 = Vendor.create!(name: "Fiesta Farms", 
                    address: "200 Christie St, Toronto, M6G 3B6", 
                    phone: "(416) 537-1235")

item1 = Item.create!(name: "Kale (organic)")
item2 = Item.create!(name: "Rice Cakes (organic)")
item3 = Item.create!(name: "Pineapple Juice (organic)")
item4 = Item.create!(name: "Granny Smith Apples (organic)")
item5 = Item.create!(name: "Himalayan Sea Salt (organic)")
item6 = Item.create!(name: "Goat Yoghurt (organic)")

vendor1.inventory_records.create(:price => 2.25, :item_id => item1.id)
vendor1.inventory_records.create(:price => 3.25, :item_id => item2.id)
vendor1.inventory_records.create(:price => 4.25, :item_id => item3.id)
vendor1.inventory_records.create(:price => 5.25, :item_id => item4.id)
vendor1.inventory_records.create(:price => 6.25, :item_id => item5.id)
vendor1.inventory_records.create(:price => 7.25, :item_id => item6.id)

vendor2.inventory_records.create(:price => 2.50, :item_id => item1.id)
vendor2.inventory_records.create(:price => 6.50, :item_id => item2.id)
vendor2.inventory_records.create(:price => 1.50, :item_id => item3.id)
vendor2.inventory_records.create(:price => 3.50, :item_id => item4.id)
vendor2.inventory_records.create(:price => 7.50, :item_id => item5.id)
vendor2.inventory_records.create(:price => 2.50, :item_id => item6.id)

vendor3.inventory_records.create(:price => 1.75, :item_id => item1.id)
vendor3.inventory_records.create(:price => 5.75, :item_id => item2.id)
vendor3.inventory_records.create(:price => 3.75, :item_id => item3.id)
vendor3.inventory_records.create(:price => 2.75, :item_id => item4.id)
vendor3.inventory_records.create(:price => 6.75, :item_id => item5.id)
vendor3.inventory_records.create(:price => 3.75, :item_id => item6.id)
