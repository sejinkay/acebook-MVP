Rails.application.routes.draw do
  get'/' => 'users#new'
  post '/users' => 'users#create'
  get 'login', to: 'sessions#new', as: 'login'
  post '/login' => 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  post 'users/:id' => 'posts#create'
<<<<<<< HEAD

  get '/profile' => 'users#profile'
  post '/profile' => 'posts#profile_update'
  # get '/users/:id', to: 'posts#user_wall', as: 'mywall'
=======
>>>>>>> develop

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  resources :users
  # , only: [:index, :show, :new, :create, :edit, :update, :destroy]

  root "users#new"
end
