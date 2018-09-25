# == Schema Information
#
# Table name: properties
#
#  id                          :bigint(8)        not null, primary key
#  name                        :string
#  property_type_id            :bigint(8)
#  address                     :text
#  zip_code                    :string
#  city                        :string
#  state                       :string
#  contract_signer             :string
#  designation                 :string
#  special_instructions        :text
#  booking_cancellation_period :string
#  booking_cancellation_policy :text
#  user_id                     :bigint(8)
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  currency_id                 :bigint(8)
#  time_zone_id                :bigint(8)
#  latitude                    :string
#  longitude                   :string
#  facebook_address            :string
#  skype_address               :string
#  twitter_address             :string
#  residential_property_id     :bigint(8)
#  country                     :string
#

class Property < ApplicationRecord
  belongs_to :property_type
  belongs_to :user
  belongs_to :currency
  belongs_to :time_zone
  belongs_to :residential_property

  has_one :policy, dependent: :destroy
  has_many :taxes, dependent: :destroy
  has_many :service_fees, dependent: :destroy
  has_many :photos, as: :imageable, dependent: :destroy
  has_many :property_amenities, as: :ameniable, dependent: :destroy

  accepts_nested_attributes_for :policy, allow_destroy: true
  accepts_nested_attributes_for :taxes, allow_destroy: true
  accepts_nested_attributes_for :service_fees, allow_destroy: true
  
  
end
