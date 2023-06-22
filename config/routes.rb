Rails.application.routes.draw do
  # User Login Routes
  get 'login', to: 'login#index'
  post 'login', to: 'login#create'
  delete 'logout', to: 'login#destroy'

  # User Registration Routes
  get 'registration', to: 'registration#index'
  post 'registration', to: 'registration#create'

  # User Profile Route
  get 'profile', to: 'profile#index'

  # Book Routes
  resources :books

  # Root Route
  root "home#index"
end
