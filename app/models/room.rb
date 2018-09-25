# == Schema Information
#
# Table name: rooms
#
#  id                     :bigint(8)        not null, primary key
#  name                   :string
#  bed_detail             :string
#  number_of_person       :string
#  smoking_allowed        :boolean
#  room_size_value        :float
#  room_size_unit         :string
#  adults_only            :boolean
#  wheel_chair_accessible :boolean
#  bed_type               :string
#  bed_count              :integer
#  block_id               :bigint(8)
#  room_type_id           :bigint(8)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Room < ApplicationRecord
  belongs_to :block
  belongs_to :room_type

  ROOMVIEWS = ["Beach view","Ocean view","City view","Pool view","Partial ocean view","Bay view","Canal view","Harbor view","Hill view","Lagoon view","Courtyard view","River view","Marina view","Lake view","Park view","Partial lake view","Sea view","Partial sea view","Resort view","Valley view","Vineyard view","Garden view","Golf view","Mountain view"]
  ROOMCLASS = ["Basic","Business","City","Classic","Club","Comfort","Deluxe","Design","Economy","Elite","Exclusive","Executive","Family","Gallery","Grand","Honeymoon","Junior","Luxury","Panoramic","Premier","Premium","Presidential","Romantic","Royal","Senior","Signature","Standard","Superior","Traditional"]
end
