# == Schema Information
#
# Table name: bed_types
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BedType < ApplicationRecord
	has_many :additional_beds, dependent: :destroy

  BEDTYPES = ["Single Bed/Twin Bed (29-39in / 74-100cm wide)","Large Single Bed/Large Twin Bed (39-49in / 100-125cm wide)","Double Bed (49-59in / 125-150cm wide)","Queen Bed (59-70in / 150-180cm wide)","King Bed (70-82in / 180-210cm wide)","Water Bed","Bunk Bed","Sofa Bed","Futon","Trundle Bed","Murphy Bed"]
end
