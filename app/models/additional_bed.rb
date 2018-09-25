# == Schema Information
#
# Table name: additional_beds
#
#  id               :bigint(8)        not null, primary key
#  bed_quantity     :integer
#  bed_charges      :float
#  bed_charges_unit :string
#  block_id         :bigint(8)
#  bed_type_id      :bigint(8)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class AdditionalBed < ApplicationRecord
  belongs_to :block
  belongs_to :bed_type

  ADDITIONALBEDS = ["Rollaway Bed","Crib","Sofa Bed","Day Bed"]
end
