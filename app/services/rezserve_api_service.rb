class RezserveAPIService

    
  APIENDPOINTS = {
    'register' => '/signup',
    'login' => '/signin',
    'update_user' => '/update_user',
    'add_property' => '/create_property',
    'save_property_setting' => '/save_property_settings',
    'property_static_data' => '/property_static_data',
    'settings_static_data' => '/settings_static_data'
  }

  REZSERVECREDENTIALS = {
    "base_url" => Rails.application.secrets.rezserve_base_url,
    "api_key" => Rails.application.secrets.rezserve_api_key
  }

  def registerUser(user_info)
    apiCallURL(REZSERVECREDENTIALS['base_url'] + APIENDPOINTS['register'], user_info, "POST")
  end

  def loginUser(user_info)
    apiCallURL(REZSERVECREDENTIALS['base_url'] + APIENDPOINTS['login'], user_info, "POST")
  end

  def checkUser(params, dt_response)
    response = loginUser(params.slice("email"))
    if !JSON.parse(response.read_body)["success"]
      registerUser(
        {
          "user" => {
            "email" => dt_response["data"]['profile']['email'],
            "dt_uuid" => dt_response["data"]['profile']['profileUserUUID'],
            "first_name" => dt_response["data"]['profile']['profileFirstName'],
            "last_name" => dt_response["data"]['profile']['profileLastName'],
            "account_status" => 1,
            "user_type_id" => 2
          }
          
        }
      )
      loginUser(params.slice("email"))
    end
  end

  # def updateUser(user){
  #   return this->apiCallURL(this->base_url . this->apiEndpoints['update_user'], user)
  # end

  # def addProperty(property){
  #   return this->apiCallURL(this->base_url . this->apiEndpoints['add_property'], property)
  # end

  # def getPropertyStaticData(){
  #   return this->apiCallURL(this->base_url . this->apiEndpoints['property_static_data'])
  # end

  # def getPropertySettingStaticData(){
  #   return this->apiCallURL(this->base_url . this->apiEndpoints['settings_static_data'])
  # end

  # def savePropertySetting(property_settings){
  #   return this->apiCallURL(this->base_url . this->apiEndpoints['save_property_setting'], property_settings)
  # end

  def apiCallURL(url, params, request_method)
    if request_method.eql?("POST")
      debugger
      HTTParty.post(url, :body => params.to_json, :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json', "api_key" =>  REZSERVECREDENTIALS["api_key"]} )
    else
      headers.merge!('Content-Type' => 'application/json', 'Accept' => 'application/json')
      HTTParty.get(url, headers: {})
    end
  end
end