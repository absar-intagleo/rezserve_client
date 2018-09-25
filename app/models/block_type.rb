# == Schema Information
#
# Table name: block_types
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BlockType < ApplicationRecord
	has_many :blocks, dependent: :destroy

  BLOCKTYPES = ["Double Room Single Use","Duplex","House","Loft","Mobile Home","Penthouse","Quadruple Room","Room","Shared Dormitory","Single Room","Studio","Studio Suite","Suite","Tent","Tree House","Triple Room","Twin Room","Villa","Townhome","Apartment","Bungalow","Cabin","Chalet","Condo","Cottage","Double or Twin Room","Double Room"]
end
