Rails.application.routes.draw do
 devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :offers, only: [:index]
  
  require "sidekiq/web"
  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'

  resources :orders, only: [:index, :create] do
    resources :payments, only: [:new, :create]

  end
end
