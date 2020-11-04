Rails.application.routes.draw do
  devise_for :users
  root to:"seeds#index"
  resources :users, only: [:show, :edit, :update, :destroy]
  get '/mypage' => 'users#mypage'
end
