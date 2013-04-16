require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "Item requires name on create" do
    item = FactoryGirl.build(:item, :name => nil)
    assert_false item.save
    assert_equal "Name can't be blank", item.errors.full_messages.first
  end

  test "Item saves" do
    item = FactoryGirl.build(:item)
    assert item.save
    assert_equal "kale (organic)", item.name
  end
end
