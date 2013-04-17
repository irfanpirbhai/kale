require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "item requires name on create" do
    item = FactoryGirl.build(:item, :name => nil)
    assert_false item.save
    assert_equal "Name can't be blank", item.errors.full_messages.first
  end

  test "item saves" do
    item = FactoryGirl.build(:item)
    assert item.save
    assert_equal "Kale (Organic)", item.name
  end
end
 