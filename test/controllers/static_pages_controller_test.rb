require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

  test "should get home" do
    get :home
    assert_response :success
     assert_select "title", "Home | Food Order"
  end

  

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Food Order"
  end
   


end