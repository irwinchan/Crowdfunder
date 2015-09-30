Rails.application.routes.draw do
  root 'projects#index'
  resources :rewards
  resources :projects
  resources :users
  resources :user_sessions

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
