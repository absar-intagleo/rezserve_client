# == Schema Information
#
# Table name: time_zones
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  utc_offset :integer
#

class TimeZone < ApplicationRecord
	has_many :properties, dependent: :destroy
end
