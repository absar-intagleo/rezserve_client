# == Schema Information
#
# Table name: amenity_types
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AmenityType < ApplicationRecord
	has_many :property_amenities, dependent: :destroy
end
