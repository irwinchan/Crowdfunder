Rails.application.routes.draw do
  root 'projects#index'
  
  resources :users
  resources :user_sessions

  resources :projects do
  	resources :rewards do
  		resources :pledges
  	end
  end

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
