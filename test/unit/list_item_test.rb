require 'test_helper'

class ListItemTest < ActiveSupport::TestCase
 
  test "list_item created successfully" do
    list_item_setup
    list_item = FactoryGirl.build(:list_item, :list => @user.list, :item => @item, :inventory_record => @inventory_record)
    assert list_item.save
  end

  test "list_item needs an item" do
    list_item_setup
    list_item = FactoryGirl.build(:list_item, :list => @user.list, :item => nil, :inventory_record => @inventory_record)
    assert_false list_item.save
    assert_equal "Item can't be blank", list_item.errors.full_messages.first
  end

  test "list_item needs an inventory_record" do
    list_item_setup
    list_item = FactoryGirl.build(:list_item, :list => @user.list, :item => @item, :inventory_record => nil)
    assert_false list_item.save
    assert_equal "Inventory record can't be blank", list_item.errors.full_messages.first
  end

  test "list_item needs a list" do
    list_item_setup
    list_item = FactoryGirl.build(:list_item, :list => nil, :item => @item, :inventory_record => @inventory_record)
    assert_false list_item.save
    assert_equal "List can't be blank", list_item.errors.full_messages.first
  end

  test "list_item cannot be repeated" do
    list_item_setup
    list_item = FactoryGirl.build(:list_item, :list => @user.list, :item => @item, :inventory_record => @inventory_record)
    assert list_item.save
    list_item2 = FactoryGirl.build(:list_item, :list => @user.list, :item => @item, :inventory_record => @inventory_record)
    assert_false list_item2.save
    assert_equal "Item should be on list only once", list_item2.errors.full_messages.first
  end

end


 