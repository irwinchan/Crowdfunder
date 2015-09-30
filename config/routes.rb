Rails.application.routes.draw do
  root 'projects#index'
  resources :users, only: [:show, :new, :create]
  resources :user_sessions
  resources :projects do
    resources :rewards, only: [:show, :new, :create] do
      resources :pledges, only: [:show, :new, :create]
    end
  end
end
