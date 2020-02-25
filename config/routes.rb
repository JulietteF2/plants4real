Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  #root to: 'pages#home'
  root to: 'plants#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :reviews, only: [:destroy]

  resources :plants do
    resources :bookings, only: [:new]
  end

  resources :bookings, except: [:new] do
    resources :reviews, only: [:new, :create, :edit, :update, :index]
  end
end
