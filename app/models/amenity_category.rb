# == Schema Information
#
# Table name: amenity_categories
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AmenityCategory < ApplicationRecord
end
