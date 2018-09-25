class UsersController < ApplicationController

	def logout
    session.delete(:login_user)
    flash[:success] = 'User logged out successfully'
    redirect_to root_path
  end

  def sso_logout
  	redirect_to DigitalTownService.new.userLogout()
  end

  def facebook_login
    redirect_to DigitalTownService.new.facebookLogin()
  end

  def google_login
    redirect_to DigitalTownService.new.googleLogin()
  end

  def linkedin_login
    redirect_to DigitalTownService.new.linkedinLogin()
  end

  def social_login
    user = DigitalTownService.new.userDetail(params[:acessToken])
    @response =  DigitalTownService.new.userProfile({ "access_token" => params[:acessToken], "user_id" => user["id"], "uuid" => user["uuid"] })
    if @response["errror"].blank?
    	@user = User.find_by_email(@response['data']['profile']['email'])
    	unless @user.present? 
		    @user = User.new( 
            email: @response["data"]['profile']['email'],
            dt_uuid: @response["data"]['profile']['profileUserUUID'],
            first_name: @response["data"]['profile']['profileFirstName'],
            last_name: @response["data"]['profile']['profileLastName'],
            account_status: 1,
            user_type_id: 2
		      )
		    @user.save!
		  end
		  setUserSession
	    flash[:success] = @user["message"]
	    redirect_to dashboard_index_path
    else
    	flash[:error] = @response["message"]
    end
  end

end
