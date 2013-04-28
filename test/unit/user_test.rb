require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "user created successfully" do
    password = "1234"
    user = FactoryGirl.build(:user, :password => password)
    assert user.save
  end

  test "user requires first name on create" do
    password = "1234"
    user = FactoryGirl.build(:user, :first_name => nil)
    assert_false user.save
    assert_equal "First name can't be blank", user.errors.full_messages.first
  end

  test "user requires last name on create" do
    password = "1234"
    user = FactoryGirl.build(:user, :last_name => nil)
    assert_false user.save
    assert_equal "Last name can't be blank", user.errors.full_messages.first
  end

  test "user requires email on create" do
    password = "1234"
    user = FactoryGirl.build(:user, :email => nil)
    assert_false user.save
    assert_equal "Email can't be blank", user.errors.full_messages.first
  end

  test "user requires password on create" do
    password = "1234"
    user = FactoryGirl.build(:user, :password => nil)
    assert_false user.save
    assert_equal "Password can't be blank", user.errors.full_messages.first
  end

  test "user email cannot be repeated" do
    email = "test@test.com"
    password = "1234"
    user = FactoryGirl.build(:user, :email => email, :password => password)
    assert user.save
    user2 = FactoryGirl.build(:user, :email => email, :password => password)
    assert_false user2.save
    assert_equal "Email has already been taken", user2.errors.full_messages.first
  end

end