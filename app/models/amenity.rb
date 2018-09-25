# == Schema Information
#
# Table name: amenities
#
#  id                  :bigint(8)        not null, primary key
#  name                :string
#  description         :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  amenity_category_id :bigint(8)
#  is_property_level   :string
#

class Amenity < ApplicationRecord
	has_many :property_amenities, dependent: :destroy
end
