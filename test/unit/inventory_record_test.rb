require 'test_helper'

class InventoryRecordTest < ActiveSupport::TestCase

  test "inventory_record is successfully created" do
    inventory_record = FactoryGirl.build(:inventory_record)
    assert inventory_record.save
    assert_equal 325, inventory_record.price_cents
    assert_equal 3.25, inventory_record.price # assert that money gem is working
  end

  test "each vendor cannot have multiples of the same item" do
    inventory_record = FactoryGirl.build(:inventory_record)
    assert inventory_record.save
    item = inventory_record.item
    vendor = inventory_record.vendor
    inventory_record2 = FactoryGirl.build(:inventory_record, :vendor => vendor, :item => item)
    assert_false inventory_record2.save
    assert_equal "Item should belong to vendor only once", inventory_record2.errors.full_messages.first
  end

  test "inventory_record must have a vendor" do
    inventory_record = FactoryGirl.build(:inventory_record, :vendor => nil)
    assert_false inventory_record.save
    assert_equal "Vendor can't be blank", inventory_record.errors.full_messages.first
  end

  test "inventory_record must have an item" do
    inventory_record = FactoryGirl.build(:inventory_record, :item => nil)
    assert_false inventory_record.save
    assert_equal "Item can't be blank", inventory_record.errors.full_messages.first
  end

  test "inventory_record must have a valid price_cents" do
    inventory_record = FactoryGirl.build(:inventory_record, :price_cents => nil)
    assert_false inventory_record.save
    assert_equal "Price cents is not a number", inventory_record.errors.full_messages.first
  end

end