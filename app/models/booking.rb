class Booking < ApplicationRecord
    include PriceCalculator
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :animal_name, presence: true
    validates :animal_type, presence: true
    validates :hours_requested, presence: true
    validates :service_date, presence: true

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
