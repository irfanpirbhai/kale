require 'test_helper'

class InventoryRecordTest < ActiveSupport::TestCase

 test "inventory_record is successfully created" do
    inventory_record = FactoryGirl.build(:inventory_record)
    assert inventory_record.save
    assert_equal 325, inventory_record.price_cents
    assert_equal 3.25, inventory_record.price # assert that money gem is working
  end

end