class Booking < ApplicationRecord
    include PriceCalculator
    enum animal_type: { dog: 0, cat: 1 }

    def appointment_price
        PriceCalculator.calculate_appointment_price(self.animal_type, self.hours_requested)
        10
    end
end
