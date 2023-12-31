require "test_helper"

class BookingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking = bookings(:one)
  end

  test "should get new" do
    get new_booking_url
    assert_response :success
  end

  test "should create booking" do
    assert_difference("Booking.count") do
      post bookings_url, params: { booking: { animal_name: @booking.animal_name, animal_type: @booking.animal_type, first_name: @booking.first_name, hours_requested: @booking.hours_requested, last_name: @booking.last_name, service_date: @booking.service_date } }
    end

    assert_redirected_to booking_url(Booking.last)
  end

  test "should show booking" do
    get booking_url(@booking)
    assert_response :success
  end

  test "should get edit" do
    get edit_booking_url(@booking)
    assert_response :success
  end

  test "should update booking" do
    patch booking_url(@booking), params: { booking: { animal_name: @booking.animal_name, animal_type: @booking.animal_type, first_name: @booking.first_name, hours_requested: @booking.hours_requested, last_name: @booking.last_name, service_date: @booking.service_date } }
    assert_redirected_to booking_url(@booking)
  end

  test "should destroy booking" do
    assert_difference("Booking.count", -1) do
      delete booking_url(@booking)
    end

    assert_redirected_to admin_bookings_url
  end
end
