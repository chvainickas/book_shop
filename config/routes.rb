Rails.application.routes.draw do
  resources :books
  resources :users, only: [:new, :create]
  resources :orders, only: [:index, :show, :new, :create]

  # Cart routes
  resource :cart, only: [:show] do
    post 'add_item', on: :collection
    patch 'update_item/:id', to: 'carts#update_item', as: 'update_item', on: :collection
    delete 'remove_item/:id', to: 'carts#remove_item', as: 'remove_item', on: :collection
    delete 'clear', on: :collection
  end

  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "up" => "rails/health#show", as: :rails_health_check

  root "books#index"
end
