json.extract! booking, :id, :first_name, :last_name, :animal_name, :animal_type, :hours_requested, :service_date, :created_at, :updated_at
json.url booking_url(booking, format: :json)
