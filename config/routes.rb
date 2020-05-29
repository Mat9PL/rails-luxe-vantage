Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :cars do
    resources :bookings, only: [:create, :show]
  end
  resources :users, only: [:show, :edit, :update]
end
