Rails.application.routes.draw do
  get'/' => 'users#new'
  post '/users' => 'users#create'
  get 'login', to: 'sessions#new', as: 'login'
  post '/login' => 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  post 'users/:id' => 'posts#create'
  get 'users/all' => 'users#all'

  get '/profile' => 'users#profile'
  post '/profile' => 'users#profile_update'
  # get '/users/:id', to: 'posts#user_wall', as: 'mywall'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  resources :users
  # , only: [:index, :show, :new, :create, :edit, :update, :destroy]

  root "users#new"
end
