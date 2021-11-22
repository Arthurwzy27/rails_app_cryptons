Rails.application.routes.draw do
  resources :portfolios do
    resources :entries, only: [:new, :create]
  end
  resources :entries, only: [:edit, :update, :destroy]
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
