class Api::V1::Authentication::BaseController < ApplicationController

	before_action :validate_api_key

	private

	def validate_api_key
		unless request.headers.env["HTTP_API_KEY"].present? && (ActiveSupport::SecurityUtils.secure_compare(ENV['HOTELS_SITE_API_KEY'],request.headers.env["HTTP_API_KEY"]))
      response = request.headers.env["HTTP_API_KEY"].present? ? "Invalid api_key" :  "Missing header api_key"  
			render(json: {success: false, message: response, status: 401}) and return
		end
	end	
end
