# == Schema Information
#
# Table name: currencies
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  symbol     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  iso_code   :string
#

class Currency < ApplicationRecord
	has_many :properties, dependent: :destroy
  
end
