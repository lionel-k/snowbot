Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :offers, only: [:index]
  resources :orders, only: [:index, :create]
end
