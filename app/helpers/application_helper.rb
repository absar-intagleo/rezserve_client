module ApplicationHelper

	# def current_user
	# 	session[:login_user].present? ? OpenStruct.new(session[:login_user]) : nil
	# end

	def resource_name
    :user
  end

  def resource_class 
     User 
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
