# == Schema Information
#
# Table name: property_settings
#
#  id                      :bigint(8)        not null, primary key
#  minimum_age_limit       :integer
#  check_in_time           :string
#  check_out_time          :string
#  age_category            :string
#  adult_age_limit         :integer
#  infant_age_limit        :integer
#  smoking_policy          :string
#  residential_property_id :bigint(8)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class PropertySetting < ApplicationRecord
  belongs_to :residential_property
end
