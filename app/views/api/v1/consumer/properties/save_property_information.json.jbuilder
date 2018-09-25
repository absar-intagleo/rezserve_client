json.success true
json.message 'Your property has been created successfully'
json.property do
	json.id @property.id 
	json.name @property.name
  json.property_type_id @property.property_type_id
  json.address @property.address
  json.longitude @property.longitude
  json.latitude @property.latitude
  json.zip_code @property.zip_code
  json.city @property.city
  json.state @property.state
  json.country @property.country
  json.currency_id @property.currency_id
  json.time_zone_id @property.time_zone_id
  json.star_rating_id @property.residential_property.star_rating_id
  json.rating_source_id @property.residential_property.rating_source_id
  json.hotel_chain_id @property.residential_property.hotel_chain_id
  json.contract_signer @property.contract_signer
  json.designation @property.designation
  json.special_instructions @property.special_instructions
  json.booking_cancellation_period @property.booking_cancellation_period
  json.booking_cancellation_policy @property.booking_cancellation_policy
  json.facebook_address @property.facebook_address
  json.skype_address @property.skype_address
  json.twitter_address @property.twitter_address
  json.residential_property_id @property.residential_property_id
end