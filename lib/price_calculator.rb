module PriceCalculator
    BASE_RATE = 20

    def hourly_price_by_animal_type
        {
            cat: 5,
            dog: 10
        }
    end
    
    def calculate_appointment_price(type_of_animal, hours)
        hourly_price_by_animal_type[type_of_animal] * hours + BASE_RATE
    end
end