Rails.application.routes.draw do
  get'/' => 'users#new'
  post '/users' => 'users#create'
  get 'login', to: 'sessions#new', as: 'login'
  post'/login' => 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'


resources :posts, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  # get 'logout', to: 'sessions#destroy', as: 'logout'
  #resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  # resources :sessions, only: [:new, :create, :destroy]
  root 'users#new'
end
