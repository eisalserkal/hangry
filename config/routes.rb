Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :restaurants, only: [:create, :new, :destroy, :show] do
    resources :covers, only: [:show, :create, :destroy]
    resources :foods
    resources :orders, only: [:index]
    resources :waiters
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
