class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.float :chargeable_rate
      t.string :currency_code
      t.string :email
      t.string :phone_number
      t.string :address
      t.string :city
      t.string :country_code
      t.string :postal_code
      t.string :locale
      t.string :itinerary_id
      t.string :confirmation_number
      t.float :surcharge_total
      t.string :cancellation_number
      t.datetime :cancellation_time
      t.string :status
      t.datetime :arrival_date
      t.datetime :departure_date
      t.string :wallet_name
      t.references :block, foreign_key: true
      t.string :dt_uuid
      t.string :loyalty_id

      t.timestamps
    end
  end
end
