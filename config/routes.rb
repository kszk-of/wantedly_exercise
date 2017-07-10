Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users do
  	member do
  		get :following, :followers
  	end
  end
  resources :skills, only: [:create, :destroy] do
  	resources :likes, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
end
