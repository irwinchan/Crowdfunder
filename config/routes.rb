Rails.application.routes.draw do

  root 'projects#index'
  resources :user_sessions
  resources :users
  resources :pledges, only: [:show, :new]
  resources :projects do
    resources :rewards, only: [:show, :new, :create] do
      resources :pledges, only: [:show, :new, :create]
    end
  end
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
end