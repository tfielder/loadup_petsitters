require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bookings = []
    @bookings << bookings(:one)
    @bookings << bookings(:two)
    @price_total = 12345
  end
  
  test "should get index" do
    get admin_bookings_url
    assert_response :success
  end
end
