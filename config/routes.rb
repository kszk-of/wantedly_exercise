Rails.application.routes.draw do
  root 'static_pages#home'

  get 'users/new'
  resources :users
  resources :skills, only: [:create, :destroy]
end
