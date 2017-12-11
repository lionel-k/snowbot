Rails.application.routes.draw do
 devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :offers, only: [:index, :create, :show]

  require "sidekiq/web"
  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :orders, only: [:index, :create, :show] do
    resources :payments, only: [:new, :create]
  end

  mount Facebook::Messenger::Server, at: 'bot'
end
