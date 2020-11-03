Rails.application.routes.draw do
  get 'seeds/index'
  devise_for :users

end
