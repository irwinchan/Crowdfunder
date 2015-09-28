Rails.application.routes.draw do
  root 'project#index'
  resources :projects
end
