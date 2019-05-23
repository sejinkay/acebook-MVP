Rails.application.routes.draw do

  get'/' => 'users#new'
  post '/users' => 'users#create'
  get 'login', to: 'sessions#new', as: 'login'
  post '/login' => 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  # resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  root "users#new"

end
