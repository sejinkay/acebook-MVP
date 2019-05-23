Rails.application.routes.draw do
  get'/' => 'users#new'
  post '/users' => 'users#create'
  get 'login', to: 'sessions#new', as: 'login'
  post'/login' => 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'

<<<<<<< HEAD
=======
  post '/login', to: 'sessions#create'

  get 'sessions/create'
>>>>>>> 4bff20437b77a12cf7a25a4572fb21122bec329d

resources :posts, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  # get 'logout', to: 'sessions#destroy', as: 'logout'
  #resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  # resources :sessions, only: [:new, :create, :destroy]
  root 'users#new'
end
