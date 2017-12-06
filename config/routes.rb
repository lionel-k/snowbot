Rails.application.routes.draw do
 devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :offers, only: [:index]
  resources :orders, only: [:index, :create]

  require "sidekiq/web"
  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end
end
