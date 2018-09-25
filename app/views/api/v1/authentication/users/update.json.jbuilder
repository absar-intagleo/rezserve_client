json.success true
json.message 'Updated Successfully'
json.user  do 
	json.first_name @user.first_name
	json.last_name @user.last_name
	json.email @user.email
	json.dt_uuid @user.dt_uuid
	json.user_type_id @user.user_type_id
	json.account_status @user.account_status
end