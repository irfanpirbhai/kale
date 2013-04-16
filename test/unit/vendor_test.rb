require 'test_helper'

class VendorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "vendor requires name on create" do
    vendor = FactoryGirl.build(:vendor, :name => nil)
    assert_false vendor.save
    assert_equal "Name can't be blank", vendor.errors.full_messages.first
  end

  test "vendor saves" do
    vendor = FactoryGirl.build(:vendor)
    assert vendor.save
    assert_equal "Karma Coop", vendor.name
    assert_equal "739 Palmerston Ave, Toronto ON, M6G 2R3", vendor.address
    assert_equal "(416) 534-1470", vendor.phone
  end


  test "address is geocoded automatically" do
    vendor = FactoryGirl.create(:vendor)
    assert_not_nil vendor.latitude
    assert_not_nil vendor.longitude
  end
  
end
 
