Rails.application.routes.draw do
  resources :books
  resources :users, only: [:new, :create]

  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "up" => "rails/health#show", as: :rails_health_check

  root "books#index"
end
