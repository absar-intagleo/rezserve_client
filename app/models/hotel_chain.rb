# == Schema Information
#
# Table name: hotel_chains
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  chain_code :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class HotelChain < ApplicationRecord
	has_many :residential_properties, dependent: :destroy

	validates_presence_of :name
	validates_uniqueness_of :name
end
