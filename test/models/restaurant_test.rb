require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


  def setup
    @user = users(:michael)
    # This code is not idiomatically correct.
    @restaurant = @user.restaurants.build(name: "Food Order")
  end

  test "should be valid" do
    assert @restaurant.valid?
  end

  test "user id should be present" do
    @restaurant.user_id = nil
    assert_not @restaurant.valid?
  end

  test "content should be present" do
    @restaurant.name = "   "
    assert_not @restaurant.valid?
  end

  test "content should be at most 140 characters" do
    @restaurant.name = "a" * 141
    assert_not @restaurant.valid?
  end
  
end
