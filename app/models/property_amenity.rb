# == Schema Information
#
# Table name: property_amenities
#
#  id              :bigint(8)        not null, primary key
#  amenity_id      :bigint(8)
#  amenity_type_id :bigint(8)
#  reference_id    :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  ameniable_type  :string
#  ameniable_id    :bigint(8)
#

class PropertyAmenity < ApplicationRecord
  belongs_to :amenity
  belongs_to :amenity_type
  belongs_to :ameniable, polymorphic: true
end
