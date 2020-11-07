Rails.application.routes.draw do
  devise_for :users
  root to:"seeds#index"
  get '/mypage' => 'users#mypage'
  resources :users, only: [:show, :edit, :update, :destroy]

  resources :seeds

    resources :rooms, only: [:index, :new, :create, :destroy] do
      resources :messages, only: [:index, :create]
    end
end
