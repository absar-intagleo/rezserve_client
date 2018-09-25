# == Schema Information
#
# Table name: star_ratings
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class StarRating < ApplicationRecord
	has_many :residential_properties, dependent: :destroy


	STARRATINGS = ["0", "1", "1.5", "2", "2.5", "3", "3.5", "4", "4.5", "5"]
end
