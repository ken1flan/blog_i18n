Rails.application.routes.draw do
  resources :users
  resource :session, only: %w[new create destroy]
  root 'top#index'
end
