class ApplicationController < ActionController::Base
	  # before_action :authenticate_user!
	before_action :redirect_to_contract

	# private

	# def validate_api_key
	# 	unless params["apiKey"].present? && (ActiveSupport::SecurityUtils.secure_compare(ENV['HOTELS_SITE_API_KEY'],params["apiKey"])
 #      response = params["apiKey"].present? ? {"error": "Invalid Authentication" } : {"error": "Missing parameter: ApiKey" } 
	# 		render(json: response.to_json, status: 401) and return
	# 	end
	# end

	# def validate_api_secret
	# 	unless params["secretKey"].present? && (ActiveSupport::SecurityUtils.secure_compare(ENV['HOTELS_SITE_SECRET_KEY'],params["secretKey"])
 #      response = params["secretKey"].present? ? {"error": "Invalid Authentication" } : {"error": "Missing parameter: secretKey" } 
	# 		render(json: response.to_json, status: 401) and return
	# 	end
	# end

	def after_sign_in_path_for(resource)
    dashboard_index_path
  end

	def current_user
		session[:login_user].present? ? User.find(session[:login_user]["rezserve_user_id"]) : nil
	end

	def redirect_to_contract
		if params[:controller].eql?("dashboard") && params[:action].eql?("index")
			redirect_to contract_dashboard_index_path unless current_user.contract_signed
		end 
	end
	
	protected
	def setUserSession
    session[:login_user] = {
      "rezserve_user_id" => @user.present? ? @user.id : nil,
      "uuid" => @response['data']['profile']['profileUserUUID'],
      "first_name" => @response['data']['profile']['profileFirstName'],
      "last_name" => @response['data']['profile']['profileLastName'],
      "email" => @response['data']['profile']['email'],
      "account_status" => @user.present? ? @user.account_status : nil,
      "about" => @response['data']['profile']['profileAbout'],
      "facebook" => @response['data']['profile']['profileFacebook'],
      "instagram" => @response['data']['profile']['profileInstagram'],
      "linkedin" => @response['data']['profile']['profileLinkedin'],
      "twitter" => @response['data']['profile']['profileTwitter'],
      "phone_number" => @response['data']['phone'].present? ? @response['data']['phone']['contactPhoneNumber'] : "",
      "profile_image" => @response['data']['images'][0].present? ? @response['data']['images'][0]['imageURL'] : ""
    }
  end

end
