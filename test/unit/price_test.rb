require 'test_helper'

class PriceTest < ActiveSupport::TestCase

 test "Price is successfully created" do
    price = FactoryGirl.build(:price)
    assert price.save
    assert_equal 325, price.price_cents
    assert_equal 3.25, price.price # assert that money gem is working
  end

end
 