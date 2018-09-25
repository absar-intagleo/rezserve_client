class Api::V1::Consumer::PoliciesController < ApplicationController
	before_action :validate_params, only: :create

	def new
		@age_categories_lookup = Policy::AGE_CATEGORIES_LOOKUP
  	@cancellation_period_lookup = Policy::CANCELLATION_PERIOD_LOOKUP
	  @cancellation_policy_lookup = Policy::CANCELLATION_POLICY_LOOKUP
	  @smoking_policies_lookup = Policy::SMOKING_POLICIES_LOOKUP
 	 	@room_rate_unit_lookup = Policy::ROOM_RATE_UNITS_LOOKUP
		@parking_policies_lookup = Policy::PARKING_POLICIES_LOOKUP
		@parking_rate_units_lookup = Policy::PARKING_RATE_UNITS_LOOKUP
		@pet_policies_lookup = Policy::PET_POLICIES_LOOKUP
		@taxes = Tax::TAX_ENTITIES
		@service_fees = ServiceFee::FEE_ENTITIES
	end

	def create
		@tax_updated = @service_updated = false
		@property = Property.find(params[:property_id])
		if @property.present?
			@property.policy.update(policy_params)
			params[:taxes].each do |tax_param|
				@tax_updated = @property.taxes.find_by_name(tax_param[:name]).update_attributes(fee_percentage: tax_param[:fee_percentage])
			end

			params[:service_fees].each do |service_fee|
				@service_updated = @property.service_fees.find_by_name(service_fee[:name]).update_attributes(service_type: service_fee[:service_type], duration_unit: service_fee[:duration_unit], fee: service_fee[:fee])
			end
			if @tax_updated && @service_updated
				render json: { sucess: true, message: "Policies saved successfully" }
			else
				render json: {success: false, message: "Something went wrong"}
			end
		else
			render json: { success: false, message: 'Property not Found'}
		end
	end

	private
	def policy_params
		params[:policy].permit(:booking_cancellation_period, :booking_cancellation_policy, :smoking_policy)		 
	end

	def validate_params
		error_messages = []
		error_messages << "property_id must be present"	unless params[:property_id].present?
		render json: { success: false, message: error_messages.join(",")} and return if error_messages.present?
	end
end