require "rails_helper"

describe 'Booking' do
    before :each do
        @first_name_1 = 'Yohann'
        @last_name_1 = 'Somebody'
        @animal_name_1 = 'Fido'
        @animal_type_1 = 'dog'
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
        @animal_type_2 = 'cat'
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
        it "should respond to first_name" do
            expect(@booking1).to respond_to(:first_name)
        end

        it "should respond to last_name" do
            expect(@booking1).to respond_to(:last_name)
        end
        
        it "should respond to animal_name" do
            expect(@booking1).to respond_to(:animal_name)
        end

        it "should respond to animal_type" do
            expect(@booking1).to respond_to(:animal_type)
        end

        it "should respond to hours_requested" do
            expect(@booking1).to respond_to(:hours_requested)
        end

        it "should respond to service_date" do
            expect(@booking1).to respond_to(:service_date)
        end

        it "should have correct first_name" do
            expect(@booking1.first_name).to eq(@first_name_1)
        end

        it "should have correct last_name" do
            expect(@booking1.last_name).to eq(@last_name_1)
        end
        
        it "should have correct animal_name" do
            expect(@booking1.animal_name).to eq(@animal_name_1)
        end

        it "should have correct animal_type" do
            expect(@booking1.animal_type).to eq(@animal_type_1)
        end

        it "should have correct hours_requested" do
            expect(@booking1.hours_requested).to eq(@hours_requested_1)
        end

        it "should have correct service_date" do
            expect(@booking1.service_date).to eq(@service_date_1)
        end
    end

    describe 'methods' do
        it 'should provide the correct appointment price for dog' do
            expect(@booking1.appointment_price).to eq(PriceCalculator::BASE_RATE + @booking1.hourly_price_by_animal_type[@booking1.animal_type.to_sym] * @booking1.hours_requested)
        end

        it 'should provide the correct appointment price for cat' do
            expect(@booking2.appointment_price).to eq(PriceCalculator::BASE_RATE + @booking1.hourly_price_by_animal_type[@booking2.animal_type.to_sym] * @booking2.hours_requested)
        end

        it 'should provide the correct appointment price total for all apointments' do
            expect(Booking.appointments_price_total).to eq(@booking1.appointment_price + @booking2.appointment_price)
        end
    end
end

