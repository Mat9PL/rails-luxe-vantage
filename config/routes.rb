Rails.application.routes.draw do
  get 'bookings/new'
  devise_for :users
  root to: 'pages#home'
  resources :cars
  resources :users, only: [:show, :edit, :update]
end
