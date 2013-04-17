require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest

  test "User can sign up" do
    user_signup
    assert page.has_content?("signed up")
  end

  test "User is automatically logged in upon sign up" do
    user_signup
    assert find("div.navbar").has_no_link?('Sign up')
    assert find("div.navbar").has_link?('Log out')
  end

  test "User can log in" do
    user_login
    assert page.has_content?("Welcome back")
  end

  test "User can log out" do
    visit "/"
    assert find("div.navbar").has_link?('Sign up')
    assert find("div.navbar").has_link?('Log in')
    assert find("div.navbar").has_no_link?('Log out')
    user_login
    assert find("div.navbar").has_no_link?('Sign up')
    assert find("div.navbar").has_no_link?('Log in')
    assert find("div.navbar").has_link?('Log out')
    find("div.navbar").click_link('Log out')
    assert page.has_content?("Logged out")
    assert find("div.navbar").has_no_link?('Log out')
  end

  # test "Failed sign up" do
  #   skip
  #   visit "/"
  #   find("div.navbar").click_link('Sign up')

  #   user = FactoryGirl.build(:user) 

  #   fill_in('First name', :with => user.first_name)
  #   fill_in('Last name', :with => user.last_name)
  #   fill_in('Email', :with => user.email)
  #   fill_in('Password', :with => user.password)

  #   find('form').click_button('Sign up')
  #   assert page.has_content?("Try again")
  #   assert_equal signup_path, current_path
  #   assert find("div.navbar").has_no_link?('Log out')
  # end

  # test "Failed log in" do
  #   skip
  #   password = "1234"
  #   user = FactoryGirl.create(:user, :password => password)
    
  #   visit "/login"
  #   fill_in('email', :with => user.email)
  #   fill_in('password', :with => "4321")
  #   find('form').click_button('Log in')

  #   assert page.has_content?("Invalid email or password")
  #   assert find("div.navbar").has_no_link?('Log out')
  #   assert_equal login_path, current_path
  # end

end