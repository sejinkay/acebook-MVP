Rails.application.routes.draw do
  get 'login', to: 'sessions#new', as: 'login'

  get 'sessions/create'

  get 'logout', to: 'sessions#destroy', as: 'logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  root 'users#new'
end
