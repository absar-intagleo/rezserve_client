# == Schema Information
#
# Table name: user_types
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserType < ApplicationRecord
	has_many :users, dependent: :destroy
  
  USERTYPES = [ "Admin","Property Owner","Consumer","Customer"]
end
