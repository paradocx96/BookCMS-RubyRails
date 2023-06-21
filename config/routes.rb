Rails.application.routes.draw do
  # User Registration Routes
  get 'sign_up', to: 'registration#index'
  post 'sign_up', to: 'registration#create'

  # Root Route
  root "home#index"
end
