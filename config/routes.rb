Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :restaurants do
    resources :covers
    resources :foods
    resources :waiters

  end
  resources :orders, only: [:index, :create, :show]
  resources :receipts, only: [:show]
  get "/dashboard", to: "restaurants#dashboard"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
