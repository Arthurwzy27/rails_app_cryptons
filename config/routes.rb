Rails.application.routes.draw do
  get 'coins/show'
  resources :portfolios do
    resources :entries, only: [:new, :create]
  end
  resources :entries, only: [:edit, :update, :destroy]
  devise_for :users
  root to: 'pages#home'
  get 'watchlist', to: 'pages#watchlist', as: :watchlist
  resources :coins, only: [:index, :show] do
    post "favorite", to: "coins#get_follow", as: :favorite
    post "unfavorite", to: "coins#get_unfollow", as: :unfavorite
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
