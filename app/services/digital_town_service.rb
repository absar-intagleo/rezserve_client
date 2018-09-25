class DigitalTownService

    attr_accessor :register_url, :login_url, :profile_url, :client_id, :secret_id

    APIENDPOINTS = {
      'register' => '/sso/users',
      'token' => '/oauth/token',
      'login' => '/api/users',
      'profile' => '/api/profile',
      'profile_image' => '/api/images/save',
      'forgot' => '/api/password/email',
      'google' => "/login/google?callbacksocial=",
      'facebook' => "/login/facebook?callbacksocial=",
      'linkedin' => "/login/linkedin?callbacksocial=",
      'logout' => "/ssologout/?callback="
    }

    APIBASEURLS =  {
      "register_url" => Rails.application.secrets.sso_register_url,
      "login_url" => Rails.application.secrets.sso_login_url,
      "profile_url" => Rails.application.secrets.sso_profile_url      
    }

    def registerUser(user_info)
      apiCallURL(APIBASEURLS['register_url'] + APIENDPOINTS['register'], user_info, "POST")
    end
    
    def loginUser(login_params)
      user_info = {
        "grant_type" => "password",
        "client_id" => Rails.application.secrets.sso_client,
        "client_secret" => Rails.application.secrets.sso_secret,
        "username" => login_params[:email],
        "password" => login_params[:password],
        "scope" => "ID email profile"
      }
      token = apiCallURL(APIBASEURLS['login_url'] + APIENDPOINTS['token'], user_info, "POST")
      if token["error"].present?
        return token
      elsif token["access_token"] 
        user = userDetail(token["access_token"])
        session = {
          "access_token" => token['access_token'],
          "user_id" => user['id'],
          "uuid" => user['uuid']
        }
        userProfile(session)
      end
    end

    def forgotPassword(email)
      reset_password = {
          "email" => email
      }
      # debugger
      apiCallURL(APIBASEURLS['login_url'] + APIENDPOINTS['forgot'], reset_password, "POST")
      # return this->apiCallURL(this->login_url . this->apiEndpoints['forgot'], reset_password, "POST");  
    end

    def socialLogin(access_token)
      
      
    end

    def googleLogin()
      APIBASEURLS['login_url']+ APIENDPOINTS['google'] + ENV['DOMAIN_NAME'] +'/users/social_login'
    end

    def facebookLogin()
      APIBASEURLS['login_url']+ APIENDPOINTS['facebook'] + ENV['DOMAIN_NAME']  + '/users/social_login'
    end

    def linkedinLogin()
      APIBASEURLS['login_url']+ APIENDPOINTS['linkedin'] + ENV['DOMAIN_NAME']  + '/users/social_login' 
    end

    def userLogout()
      # return this->login_url . this->apiEndpoints['logout'] . url('/');
      APIBASEURLS['login_url'] + APIENDPOINTS['logout'] + ENV['DOMAIN_NAME']  + '/users/logout'
    end

    # def updateProfile(user)
    
    #   profile = this->apiCallURL(this->profile_url . this->apiEndpoints['profile'], user, "POST", true);
    #   this->setUserSession(profile);
    #   return profile;
    # end

    # def updateProfileImage(user)
    #     profile = this->apiCallURL(this->profile_url . this->apiEndpoints['profile_image'], user, "POST", true);
    #     return profile;
    # end

    def userDetail(token)
        header = {}
        header[:authorization] = "Bearer #{token}"
        apiCallURL(APIBASEURLS['login_url'] + APIENDPOINTS['login'], nil, "GET", header)
    end

    def userProfile(session)
      header = {}
      header[:authorization] = "Bearer #{session['access_token']}"
      apiCallURL(APIBASEURLS['profile_url'] + APIENDPOINTS['profile'] + "?userID=#{session['user_id']}", nil, "GET", header)
    end

    def apiCallURL(url, params, request_type, headers={ 'Content-Type' => 'application/json' })
      @result = if request_type.eql?("POST")
        HTTParty.post(url, :body => params.to_json, :headers => { 'Content-Type' => 'application/json' } )
      else
        headers.merge!('Content-Type' => 'application/json', 'Accept' => 'application/json')
        HTTParty.get(url, headers: headers)
      end
      JSON.parse(@result.read_body)
    end
end