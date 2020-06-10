Rails.application.routes.draw do
  resources :blogs
  resource :user_registration
  resources :users
  resource :session, only: %w[new create destroy]

  root 'top#index'
end
