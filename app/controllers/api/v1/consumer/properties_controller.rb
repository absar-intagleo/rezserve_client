class Api::V1::Consumer::PropertiesController < Api::V1::Consumer::BaseController
	before_action :validate_params, only: :save_property_information
	def new
		@currencies = Currency.select(:id, :name, :symbol, :iso_code).all.order(:name)
		@chains = HotelChain.select(:id, :chain_code, :name).all.order(:name)
		@star_rating = StarRating.select(:id, :name).all.order(:name)
		@rating_source = RatingSource.select(:id, :name).all.order(:name)
		@timezones = TimeZone.select(:id, :name, :utc_offset).all.order(:utc_offset)
		@property_types = PropertyType.select(:id, :name).all.order(:name)
	end

	def save_property_information
		@user = User.find_by_dt_uuid(params[:dt_uuid])
		if @user.present?
			@property = @user.properties.build(property_params)
			@property.build_policy(minimum_age_limt: nil)
			@property.build_residential_property(resi_property_params)
			Tax::TAX_ENTITIES.each do |entity|
				@property.taxes.build(name: entity)
			end
			ServiceFee::FEES_ENTITIES.each do |entity|
				@property.service_fees.build(name: entity)
			end
			if @property.save!		
				render 'save_property_information'
			else
				render json: {success: false, message: @property.errors.full_messages.join(", ")}
			end
		else
			render json: {success: false, message: "User does not exit"}
		end
	end

	def show
		@property = Property.find(params[:property_id])
		if @property.present?			
			render 'save_property_information'
		else
			render json: {success: false, message: 'Property not Found'}
		end
	end

	private
	def property_params
		params[:property].permit(:name, :address, :latitude, :longitude, :time_zone, :zip_code, :city, :state, :currency_id, :time_zone_id, :property_type_id, :user_id, :facebook_address, :skype_address, :twitter_address, :country, service_fees_attributes: [:id, :name, :type, :fee, :duration_unit, :_destroy], taxes_attributes: [:id, :name, :fee_duration_unit, :fee_percentage, :_destroy], policy_attributes: [:id, :minimum_age_limt, :check_in_time, :check_out_time, :age_category, :adult_age_limit, :infant_age_limit, :smoking_policy, :special_instruction, :booking_cancellation_period, :booking_cancellation_policy, :_destroy])
	end

	def resi_property_params
		resi_params = { 
				hotel_chain_id: params[:hotel_chain_id],
				star_rating_id: params[:star_rating_id],
				rating_source_id: params[:rating_source_id],
				website: params[:website]
			}
		resi_params	
	end

	def validate_params
		errors = []
		errors << "dt_uuid must be present" unless params[:dt_uuid].present?
		render json: {success: false, message: errors.join(", ")} and return if errors.present?
	end
	 
end
