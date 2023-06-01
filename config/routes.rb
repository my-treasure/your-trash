Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: "offers#index"


  get "/map", to: "pages#map"

  resources :bookings, except: [:new, :create]

  resources :offers do
    resources :bookings, only: [:new, :create]
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
