Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'posts/:id/edit', to: 'posts#edit', as: :edit_posts
  patch 'posts/:id', to: 'posts#update'
  resources :posts, only: [:index, :show, :new, :create, :edit, :update, :destroy]
end
