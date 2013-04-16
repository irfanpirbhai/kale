require 'test_helper'

class VendorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Vendor requires name on create" do
    vendor = FactoryGirl.build(:vendor, :name => nil)
    assert_false vendor.save
    assert_equal "Name can't be blank", vendor.errors.full_messages.first
  end

  test "Address is geocoded automatically" do
    vendor = FactoryGirl.create(:vendor)
    assert_not_nil vendor.latitude
    assert_not_nil vendor.longitude
  end


end
 
