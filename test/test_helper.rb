ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  # fixtures :all

  # Add more helper methods to be used by all tests here...

  teardown do 
    DatabaseCleaner.clean
  end

end

DatabaseCleaner.strategy = :truncation

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL

  Capybara.app = Kale::Application
  Capybara.javascript_driver = :webkit
  
  self.use_transactional_fixtures = false 
  
  teardown do
    DatabaseCleaner.clean       # Truncate the database
    Capybara.reset_sessions!    # Forget the (simulated) browser state
    Capybara.use_default_driver # Revert Capybara.current_driver to Capybara.default_driver
  end
end

def user_signup
  visit "/"
  find("div.nav").click_link('Sign up')
  user = FactoryGirl.build(:user) 
  fill_in('First name', :with => user.first_name)
  fill_in('Last name', :with => user.last_name)
  fill_in('Email', :with => user.email)
  fill_in('Password', :with => user.password)
  fill_in('Password confirmation', :with => user.password)
  find('form').click_button('Sign up')
end

def user_login
  password = "1234"
  user = FactoryGirl.create(:user, :password => password)
  visit "/login"
  fill_in('email', :with => user.email)
  fill_in('password', :with => password)
  find('form').click_button('Log in')
end

def list_item_setup
    password = "1234"
    @user = FactoryGirl.build(:user, :password => password)
    assert @user.save
    assert @user.list.valid?

    @inventory_record = FactoryGirl.build(:inventory_record)
    assert @inventory_record.save

    @item = @inventory_record.item
end
