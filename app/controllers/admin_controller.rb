class AdminController < ApplicationController
  # GET admin/bookings
  def index
    @price_total = Booking.appointments_price_total
    @bookings = Booking.all
  end
end
