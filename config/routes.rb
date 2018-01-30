Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  resources :offers, only: [:create, :show] do
    resources :orders, only: [:create]
  end

  require "sidekiq/web"
  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :orders, only: [:index, :show] do
    resources :payments, only: [:new, :create]
  end

  mount Facebook::Messenger::Server, at: 'bot'
end
