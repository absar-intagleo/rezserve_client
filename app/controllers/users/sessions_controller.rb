# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  respond_to :html, :js
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    @response = DigitalTownService.new.loginUser(params[:user].slice(:email, :password))   
    if @response["error"].blank?
      @user = User.find_by_email(params[:user][:email])
      setUserSession
      flash[:success] = 'Signed in Successfully'
      redirect_to dashboard_index_path
      # super
    else
      flash[:error] = @response["message"]
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end


  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
end
