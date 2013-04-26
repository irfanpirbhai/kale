require 'test_helper'

class ListTest < ActiveSupport::TestCase

  test "list needs a user" do
    list = FactoryGirl.build(:list, :user => nil)
    assert_false list.save
    assert_equal "User can't be blank", list.errors.full_messages.first
  end

  test "a user can have only one list" do
    password = "1234"
    user = FactoryGirl.create(:user, :password => password)
    list = FactoryGirl.build(:list, :user => user)
    assert list.save

    # list2 = FactoryGirl.build(:list, :user => user)
    # assert_false list2.save
    # assert_equal "User has already been taken", list2.errors.full_messages.first
  end

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
