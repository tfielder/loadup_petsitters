class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :first_name
      t.string :last_name
      t.string :animal_name
      t.integer :animal_type
      t.integer :hours_requested
      t.datetime :service_date

      t.timestamps
    end
  end
end
