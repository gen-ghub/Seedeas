Rails.application.routes.draw do
  devise_for :users
  root to:"seeds#index"
  resources :users, only: [:show, :edit, :update]
  get '/mypage' => 'users#mypage'
end
