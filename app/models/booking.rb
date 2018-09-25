# == Schema Information
#
# Table name: bookings
#
#  id                  :bigint(8)        not null, primary key
#  chargeable_rate     :float
#  currency_code       :string
#  email               :string
#  phone_number        :string
#  address             :string
#  city                :string
#  country_code        :string
#  postal_code         :string
#  locale              :string
#  itinerary_id        :string
#  confirmation_number :string
#  surcharge_total     :float
#  cancellation_number :string
#  cancellation_time   :datetime
#  status              :string
#  arrival_date        :datetime
#  departure_date      :datetime
#  wallet_name         :string
#  block_id            :bigint(8)
#  dt_uuid             :string
#  loyalty_id          :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Booking < ApplicationRecord
  belongs_to :block
end
