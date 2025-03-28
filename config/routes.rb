Rails.application.routes.draw do
  root 'users#index'   # Set homepage to users list
  resources :users     # Generates CRUD routes
end
