# == Schema Information
#
# Table name: taxes
#
#  id                :bigint(8)        not null, primary key
#  name              :string
#  fee_percentage    :float
#  fee_duration_unit :string
#  property_id       :bigint(8)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Tax < ApplicationRecord
  belongs_to :property

 	TAX_ENTITIES = ['state_tax', 'federal_tax']
  TAX_VALUES = { 'state_tax' => 'State Tax', 'federal_tax' => 'Federal Tax' }
  def self.tax_value(key)
    TAX_VALUES[key]
  end

 
end
