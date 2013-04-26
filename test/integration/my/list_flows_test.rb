require 'test_helper'

class ListFlowsTest < ActionDispatch::IntegrationTest

  setup do

  end

  test "logged in user can view their list" do  
    password = "1234"
    user = FactoryGirl.create(:user, :password => password)
    
    # create list with items, belonging to user

    # list = FactoryGirl.create(:list, :user => user)
    # list.items.new
    # populate the list

    # log in user
    # visit "/login"
    # fill_in('email', :with => user.email)
    # fill_in('password', :with => password)
    # find('form').click_button('Log in')

    # user_login
    # visit '/'
    # assert page.has_content?(user.)
    # assert that cursor is in text field
    # fill_in('pledge_amount', :with => 50)
    # submit
    # assert page has content? "x"
  end



  # test "logged in user can add new item list from textfield" do
  #   user_login
  #   visit '/'
  #   assert page.has_selector?("input")
    # assert that cursor is in text field
    # fill_in('pledge_amount', :with => 50)
    # submit
    # assert page has content? "x"
  # end

  test "existing item is added to list from textfield" do
  #   user_login
  #   visit '/projects'
  #   page.click_on("Project 1")
  #   assert page.has_content?("Project 1")    
  #   assert page.has_link?('Back This Project')
  #   click_on('Back This Project')
  #   assert_equal '/projects/1/pledges/new', current_path
  #   fill_in('pledge_amount', :with => 50)
  #   find('form').click_button('Back This Project')
  #   assert_equal '/projects/1', current_path
  #   assert page.has_content?("Thanks for your support")    

  # # Verify that the pledge was created with the right attributes
  #   assert pledge = Pledge.order(:id).last
  #   assert_equal @project, pledge.project
  #   assert_equal 50, pledge.amount
  end

  test "existing item is added to list via autocomplete select" do

  end

end