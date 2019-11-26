require 'test_helper'

class RentalsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get rentals_new_url
    assert_response :success
  end

  test "should get edit" do
    get rentals_edit_url
    assert_response :success
  end

end
