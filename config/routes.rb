Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :restaurants do
    resources :covers
    resources :foods
    resources :waiters
    resources :requests, only: [:index]
  end
  resources :orders, only: [:index, :create, :update, :show] do
    resources :requests, only: [:create]
  end
  resources :receipts, only: [:show] do
    resources :payments, only: :new
  end
  resources :requests, only: [:destroy]
  resources :order_items, only: [:update]
  get "/dashboard", to: "restaurants#dashboard"
  mount StripeEvent::Engine, at: '/stripe-webhooks'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
