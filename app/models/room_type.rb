# == Schema Information
#
# Table name: room_types
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RoomType < ApplicationRecord
	has_many :rooms, dependent: :destroy
end
