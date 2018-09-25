# == Schema Information
#
# Table name: rating_sources
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RatingSource < ApplicationRecord
	has_many :residential_properties, dependent: :destroy
	RATINGSOURCES = ["National Ratings"]
end
