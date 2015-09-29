Rails.application.routes.draw do
  get 'rewards/new'

  get 'rewards/create'

  get 'rewards/show'

  root 'projects#index'
  resources :rewards
  resources :projects
end
