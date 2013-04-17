require 'test_helper'

class ListFlowsTest < ActionDispatch::IntegrationTest

  setup do
    item1 = Item.create!(name: "Kale (organic)")
    item2 = Item.create!(name: "Rice Cakes (organic)")
    item3 = Item.create!(name: "Pineapple Juice (organic)")
    item4 = Item.create!(name: "Granny Smith Apples (organic)")
    item5 = Item.create!(name: "Himalayan Sea Salt (organic)")
    item6 = Item.create!(name: "Goat Yoghurt (organic)")
  end

  test "new item is added to list from textfield" do
    visit '/'
    assert page.has_selector?("input")
    # assert that cursor is in text field
    # fill_in('pledge_amount', :with => 50)
    # submit
    # assert page has content? "x"
  end

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