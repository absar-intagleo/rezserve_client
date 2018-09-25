# == Schema Information
#
# Table name: availabilities
#
#  id                  :bigint(8)        not null, primary key
#  block_id            :bigint(8)
#  availability_matrix :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Availability < ApplicationRecord
  belongs_to :block
end
