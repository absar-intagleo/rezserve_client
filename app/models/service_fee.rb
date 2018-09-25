# == Schema Information
#
# Table name: service_fees
#
#  id            :bigint(8)        not null, primary key
#  name          :string
#  service_type  :integer
#  fee           :float
#  duration_unit :string
#  property_id   :bigint(8)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class ServiceFee < ApplicationRecord
  belongs_to :property

  FEES_ENTITIES = ['parking', 'pet', 'resort', 'cleaning']
  FEES_VALUES = {'parking' => 'Parking Fee', 'pet' => 'Pet Fee', 'resort' => 'Resort Fee', 'cleaning' => 'Clean Fee'}

  def self.tax_value(key)
    FEES_VALUES[key]
  end
end
