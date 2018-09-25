# == Schema Information
#
# Table name: property_types
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PropertyType < ApplicationRecord
	has_many :properties, dependent: :destroy

  PROPERTYTYPES = ["Apart-hotel","Apartment","Bed and breakfast","Guest house","Hostel","Hotel","Private vacation home","Villa","Agritourism","All-Inclusive","Cabin","Caravan park","Castle","Chalet","Condo","Condominium resort","Cottage","Country House","Cruise","Holiday Park","Hostal (budget hotel)","Hotel resort","House boat","Inn","Lodge","Motel","Pension","Pousada (Brazil)","Pousada (Portugal)","Ranch","Residence","Riad","Ryokan","Safari / Tentalow","Townhouse","Tree house"]
end
