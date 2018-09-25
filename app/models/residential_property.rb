# == Schema Information
#
# Table name: residential_properties
#
#  id               :bigint(8)        not null, primary key
#  website          :string
#  hotel_chain_id   :bigint(8)
#  star_rating_id   :bigint(8)
#  rating_source_id :bigint(8)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class ResidentialProperty < ApplicationRecord
  belongs_to :hotel_chain, optional: true
  belongs_to :star_rating
  belongs_to :rating_source
	has_one :property, dependent: :destroy
  has_one :property_setting, dependent: :destroy
  has_many :blocks, dependent: :destroy
end
