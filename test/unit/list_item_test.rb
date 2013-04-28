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

  test "list item needs an inventory_record" do
    list_item_setup
    list_item = FactoryGirl.build(:list_item, :list => @user.list, :item => @item, :inventory_record => nil)
    assert_false list_item.save
    assert_equal "Inventory record can't be blank", list_item.errors.full_messages.first
  end

  test "list item needs a list" do
    list_item_setup
    list_item = FactoryGirl.build(:list_item, :list => nil, :item => @item, :inventory_record => @inventory_record)
    assert_false list_item.save
    assert_equal "List can't be blank", list_item.errors.full_messages.first
  end


  # test "list_item is on list only once" do
  # end

  # test "list items are unique" do
  #   item = FactoryGirl.create(:item)
  #   assert_equal "Kale (Organic)", item.name
  #   password = "1234"
  #   user = FactoryGirl.create(:user, :password => password)
  #   list = FactoryGirl.build(:list, :user => user)
  #   assert_equal 0, list.items.count
  #   list.items << item
    
  #   assert_true list.save
    
  #   assert_equal 1, list.items.count
  #   list.items << item
  #   list.save
  #   assert_equal 1, list.items.count
  # end



end


 