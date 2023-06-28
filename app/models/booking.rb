class Booking < ApplicationRecord
    include PriceCalculator
    enum animal_type: { dog: 0, cat: 1 }

    def appointment_price
        calculate_appointment_price(self.animal_type.to_sym, self.hours_requested)
    end

    def self.appointments_price_total
        sum = 0
        Booking.all.each do |b|
            sum += b.appointment_price
        end
        sum
    end
end
