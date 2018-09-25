# == Schema Information
#
# Table name: cancellation_policies
#
#  id         :bigint(8)        not null, primary key
#  plan       :string
#  penalty    :string
#  refundable :boolean
#  block_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CancellationPolicy < ApplicationRecord
  belongs_to :block
end
