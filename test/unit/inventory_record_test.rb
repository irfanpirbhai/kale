require 'test_helper'

class InventoryRecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

 test "inventory_record is successfully created" do
    price = FactoryGirl.build(:inventory_record)
    assert price.save
    assert_equal 325, price.price_cents
    assert_equal 3.25, price.price # assert that money gem is working
  end

end