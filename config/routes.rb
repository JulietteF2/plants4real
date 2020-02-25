Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :reviews, only: [:destroy]


  resources :plants do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, except: [:new, :create, :index] do
    resources :reviews, only: [:new, :create, :edit, :update, :index]
  end
end
