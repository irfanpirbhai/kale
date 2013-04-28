require 'test_helper'

class ListTest < ActiveSupport::TestCase

  test "list needs a user" do
    list = FactoryGirl.build(:list, :user => nil)
    assert_false list.save
    assert_equal "User can't be blank", list.errors.full_messages.first
  end

  test "a list is automatically created upon new user creation" do
    password = "1234"
    user = FactoryGirl.create(:user, :password => password)
    assert user.list.valid?
  end

  test "a user can only have one list" do
    password = "1234"
    user = FactoryGirl.create(:user, :password => password)
    list = FactoryGirl.build(:list, :user => user)
    assert_false list.save
    assert_equal "User has already been taken", list.errors.full_messages.first
  end  

end
