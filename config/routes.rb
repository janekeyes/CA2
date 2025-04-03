Rails.application.routes.draw do
  root 'users#index'   # Set homepage to users list
  resources :users     # Generates CRUD routes

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
end
