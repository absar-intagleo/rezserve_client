# == Schema Information
#
# Table name: policies
#
#  id                          :bigint(8)        not null, primary key
#  minimum_age_limt            :integer
#  check_in_time               :string
#  check_out_time              :string
#  age_category                :string
#  adult_age_limit             :integer
#  infant_age_limit            :integer
#  smoking_policy              :string
#  special_instruction         :text
#  booking_cancellation_period :string
#  booking_cancellation_policy :text
#  property_id                 :bigint(8)
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#

class Policy < ApplicationRecord
  belongs_to :property

  MINIMUM_AGE_LIMIT = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22]
  CHECK_IN_TIME = ['0100', '0200', '0300', '0400', '0500', '0600', '0700', '0800', '0900', '1000', '1100' , '1200', '1300', '1400', '1500', '1600', '1700', '1800', '1900', '2000', '2100', '2200', '2300']
  AGE_CATEGORIES = ['Adults Only', 'Adults and Children']
  ADULT_AGE_LIMIT = [15, 16, 17, 18, 19]
  INFANT_AGE_LIMIT = [1, 2]

  CANCELLATION_PERIOD = ["24 hours before Check in", "Within 12 hours of booking"]
  CANCELLATION_POLICY = ["Free", "1 Night + Taxes"]
  SMOKING_POLICIES = ["Non-Smoking", "Designated Areas"]
  ROOM_RATE_UNITS = ["Per Day", "Per Night", "Per Stay"]
  PARKING_POLICIES = ["Free", "Paid"]
  PARKING_RATE_UNITS = ["Per Day", "Per Stay"]
  PET_POLICIES = ["Free", "Paid", "Not Allowed"]

  AGE_CATEGORIES_LOOKUP = { :adults_only => 'Adults Only', :adults_and_children => 'Adults and Children' }
  CANCELLATION_PERIOD_LOOKUP = { "24_hours_before_check_in" => "24 hours before Check in", "winth_12_hours_of_booking" => "Within 12 hours of booking" } 
  CANCELLATION_POLICY_LOOKUP = { "free" => "Free", "1_night_and_taxes" => "1 Night + Taxes" } 
  SMOKING_POLICIES_LOOKUP = { :not_smoking => "Non-smoking", :designated_areas => "Designated Areas" }
  ROOM_RATE_UNITS_LOOKUP = { :per_day => "Per Day", :per_night => "Per Night", :per_stay => "Per Stay" }
  PARKING_POLICIES_LOOKUP = { :free => "Free", :paid => "Paid" }
  PARKING_RATE_UNITS_LOOKUP = { :per_day => "Per Day", :per_stay => "Per Stay" }
  PET_POLICIES_LOOKUP = { :free => "Free", :paid => "Paid", :not_allowed => "Not Allowed" }
end
