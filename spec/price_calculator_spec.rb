require "rails_helper"

describe 'Pricing Engine Price Calculator' do
    before :each do
        @first_name_1 = 'Yohann'
        @last_name_1 = 'Somebody'
        @animal_name_1 = 'Fido'
        @animal_type_1 = :dog
        @hours_requested_1 = 3
        @service_date_1 = DateTime.current

        @booking1 = Booking.create(
            first_name: @first_name_1,
            last_name: @last_name_1,
            animal_name: @animal_name_1,
            animal_type: @animal_type_1,
            hours_requested: @hours_requested_1,
            service_date: @service_date_1
        )

        @first_name_2 = 'Sally'
        @last_name_2 = 'Someone'
        @animal_name_2 = 'Mr. Fluffy'
        @animal_type_2 = :cat
        @hours_requested_2 = 8
        @service_date_2 = DateTime.current

        @booking2 = Booking.create(
            first_name: @first_name_2,
            last_name: @last_name_2,
            animal_name: @animal_name_2,
            animal_type: @animal_type_2,
            hours_requested: @hours_requested_2,
            service_date: @service_date_2
        )
    end
    
    describe 'unit testing' do
        it "should have a base rate" do
            expect(PriceCalculator::BASE_RATE).to eq(20)
        end

        it "should return hourly price by animal type" do
            expect(@booking1.hourly_price_by_animal_type).to eq({ cat: 5, dog: 10})
        end

        it "should calculate appointment price for a dog" do
            expect(@booking1.calculate_appointment_price(@animal_type_1, @hours_requested_1)).to eq(PriceCalculator::BASE_RATE + @booking1.hourly_price_by_animal_type[@animal_type_1.to_sym].to_i * @hours_requested_1)
        end

        it "should calculate appointment price for a cat" do
            expect(@booking2.calculate_appointment_price(@animal_type_2, @hours_requested_2)).to eq(PriceCalculator::BASE_RATE + @booking2.hourly_price_by_animal_type[@animal_type_2.to_sym] * @hours_requested_2)
        end
    end
end