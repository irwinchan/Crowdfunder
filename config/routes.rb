Rails.application.routes.draw do
  get 'user_sessions/new'

  get 'user_sessions/create'

  get 'user_sessions/destroy'

  root 'projects#index'
  
  resources :rewards
  resources :projects
  resources :users
end
