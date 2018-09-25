# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  respond_to :html, :js
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    @response =  Rails.env.development? ? {"ok"=>true, "data"=>{"id"=>9066, "uuid"=>"b006cd54-b4c4-11e8-bf87-06b9b6fd22b8", "first_name"=>"test", "last_name"=>"test123", "email"=>"testascinasg@rezserve.com", "active"=>1, "details"=>{"email"=>"testing@rezserve.com", "method"=>"UsersController.create", "last_name"=>"test123", "first_name"=>"test"}, "remember_token"=>nil, "verified"=>false, "verification_token"=>"25b64bdc7a0bb710b51de28fb5a485703c3741c59ca1769d33696e342c17f456", "created_at"=>"2018-09-10 06:42:29", "updated_at"=>"2018-09-10 06:42:30", "message"=>"You will receive an email with instructions about how to confirm your account in a few minutes. If you don't receive please check your spam mailbox or <a href='https://v1-sso-api.digitaltown.com/email-verification/send/testing%40rezserve.com?callback=https://account.digitaltown.com/profile'>click here to resend the email. </a>", "profile"=>{"ok"=>true, "user"=>{"profile"=>{"profileID"=>8953, "profileUserID"=>9066, "profileRelationID"=>8953, "profileType"=>1, "profileFirstName"=>"test", "profileLastName"=>"test123", "profileActive"=>1, "profileCreated"=>"", "profileUpdated"=>"", "profileAbout"=>"", "profileInterests"=>"", "profileFacebook"=>"", "profileInstagram"=>"", "profileTwitter"=>"", "profileLinkedin"=>"", "url_hash"=>"aphzh8", "verification"=>{}, "profileCityID"=>"", "profileOptOutMarketing"=>0, "profileUserUUID"=>"b006cd54-b4c4-11e8-bf87-06b9b6fd22b8", "profileAcceptTermsConditions"=>0, "email"=>"testing@rezserve.com", "invites"=>[]}, "contact"=>{"contactID"=>9066, "contactSSOID"=>8953, "contactProfileID"=>"b006cd54-b4c4-11e8-bf87-06b9b6fd22b8", "contactFirstName"=>"test", "contactLastName"=>"test123", "contactPrimary"=>"1", "contactPermissions"=>"", "contactActive"=>"1", "contactCreated"=>"", "contactUpdated"=>""}, "address"=>nil, "email"=>{"contactEmailID"=>8880, "contactEmailRelationID"=>8880, "contactEmailAddress"=>"testing@rezserve.com", "contactEmailPrimary"=>1, "contactEmailActive"=>"1", "contactEmailCreated"=>"", "contactEmailUpdated"=>""}, "phone"=>nil, "images"=>[nil]}}}, "accessToken"=>"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImJmZWM5YzBjN2JjOWJhMDkxNWE4MjEyNzM1ZTkzZmU4MjJjYjY0Y2M0ZGJiNmY1N2Y0ZmU4YTE5YzBmM2Y5NWY4NmRlMDUzM2NjNjY5YTcxIn0.eyJhdWQiOiIxMTkiLCJqdGkiOiJiZmVjOWMwYzdiYzliYTA5MTVhODIxMjczNWU5M2ZlODIyY2I2NGNjNGRiYjZmNTdmNGZlOGExOWMwZjNmOTVmODZkZTA1MzNjYzY2OWE3MSIsImlhdCI6MTUzNjU2MTc0OSwibmJmIjoxNTM2NTYxNzQ5LCJleHAiOjE1NDUyMDE3NDksInN1YiI6IjkwNjYiLCJzY29wZXMiOlsiSUQiLCJlbWFpbCIsInByb2ZpbGUiLCJidXNpbmVzcyIsImF2YXRhciJdfQ.Bhq42ONvthGLDeH8QW0PwubA-O9IqpoZq4Jiipog6cw8Yj3bpJnGX9sWIkvfr-HpMizPFe9MxrgxUqZTr2kybk4vVdLvXd5aeb3pG3FqanOArGrYoOG8E7gvdDyZF9XY7Waup6HVt3fAsL_yQ3F1QD-5uUg0yu-iBJxkVTgkRv5zONJCPUG-s7d-nRYPMvLB8IoIaqyt4-l3Nk-Iu0n6bnplAxNzw-WEjfsPHg4TKKhV0elKEef1uQATt0iQUecpIHEWn2x0SQCiSI8H8Uti32tcKcWiZeNN45cXaq2RDxbiVYh17rksR_ktQaz5LwjrGi758_nDy7UqjZMN1nza5ke8B-ddPmaDitLP8y2zhwE-YYtQiudKjnsgbn_2c9XkqtzHt7x00R1cu9yXXu2RMZwPvat_ck-2JrV5ZSxc3IPaXEatJcmZsqUMSzsdu9_5URZr1XurnUvgWWlyUiQm8Lw1aeBTAvNbJaUoXnu0a2By7h_v6HY5A8jh6z_jmrLsCQ9Iurv90Tkn6orkkI6e5OcUPhsJTVdqk-BZ5SmqH0C58xddvK2w8Q9Z_TenrfVNaW2Hmzl7xECIjcrxnjzccuzstqb6Ct0QFPE8eC3P314J0UJICDOgRPMNplIbC7DSZtq1JbZI2UOgh8J-vPEEYFuQ-SCtPLt4gjMIhF-lc58"} : DigitalTownService.new.registerUser(params.slice!(:first_name, :last_name, :email, :password))
    if @response["error"].blank?      
      params[:user]["dt_uuid"] = @response['data']["uuid"]
      params[:user]["user_type_id"] = 2
      params[:user]["account_status"] = 1
      @user = User.new(sign_up_params)
      if @user.save
        redirect_to new_user_session_path, success: "You have registered successfully"
      else
        flash[:error] = @user.errors.full_messages.join(', ')
      end      
    else
      flash[:error] = @response["error"].values.join(',')
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:user, keys: [:attribute])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  #end
  private
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :account_status, :user_type_id, :dt_uuid, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :account_status, :user_type_id, :dt_uuid, :password, :password_confirmation)
  end
end
