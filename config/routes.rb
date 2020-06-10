Rails.application.routes.draw do
  resources :blogs
  resources :user_registrations
  resources :users
  resource :session, only: %w[new create destroy]

  root 'top#index'
end
