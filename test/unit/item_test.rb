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

  test "items are unique" do
    item = FactoryGirl.build(:item)
    assert item.save
    item2 = FactoryGirl.build(:item)
    assert_false item2.save
    assert_equal "Name has already been taken", item2.errors.full_messages.first
  end

end
 