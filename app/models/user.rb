# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  dt_uuid                :string
#  email                  :string
#  account_status         :integer
#  user_type_id           :bigint(8)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#

class User < ApplicationRecord
	devise :database_authenticatable, :registerable, :recoverable, stretches: 12
  belongs_to :user_type
  has_many :properties, dependent: :destroy

  validates_presence_of :email, :dt_uuid, :first_name, :last_name
  validates_uniqueness_of :email, :scope => :user_type_id

  
end
