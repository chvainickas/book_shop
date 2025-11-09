Rails.application.routes.draw do
  resources :books, only: [:index]

  # Reveal health status on /up
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "books#index"
end
