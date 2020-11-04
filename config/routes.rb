Rails.application.routes.draw do
  devise_for :users
  root to:"seeds#index"
  resources :users, only: [:show]
end
