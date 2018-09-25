# == Schema Information
#
# Table name: blocks
#
#  id                      :bigint(8)        not null, primary key
#  name                    :string
#  block_type_id           :bigint(8)
#  residential_property_id :bigint(8)
#  rate                    :float
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class Block < ApplicationRecord
  belongs_to :block_type
  belongs_to :residential_property

  has_many :additional_beds, dependent: :destroy
	has_many :rooms, dependent: :destroy
	has_many :cancellation_policies, dependent: :destroy
	has_many :imageables, dependent: :destroy
	has_many :photos, as: :imageable, dependent: :destroy
	has_many :property_amenities, as: :imageable, dependent: :destroy
	has_many :bookings, dependent: :destroy
	
	has_one :availability, dependent: :destroy

end
