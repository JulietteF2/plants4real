Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]


  resources :plants do
    resources :bookings, only: [:new]
  end

  resources :bookings, except: [:new]
end
