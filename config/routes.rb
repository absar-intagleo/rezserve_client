Rails.application.routes.draw do
 devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations',
        passwords: 'users/passwords'
      }
  root 'home#index'
  
  # namespace :users do
    # resources :sessions, only: [:new, :create] do
    #   collection do 
    #     get :logout
    #     get :facebook_login
    #     get :google_login
    #     get :linkedin_login
    #   end
    # end
  # end
  # get 'home/index'
  # # get '/social-login' => 'users/sessions#social_login'
  resources :dashboard do
    collection do
      get :contract
    end
  end
  resources :users do 
    collection do
      get :logout
      get :sso_logout
      get :google_login 
      get :facebook_login 
      get :linkedin_login
      get :social_login
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
