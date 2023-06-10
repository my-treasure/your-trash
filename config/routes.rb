Rails.application.routes.draw do

  # get 'follows/destroy'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: "offers#index"

  get "/map", to: "pages#map"

  resources :chatrooms, only: %i[show new create] do
    resources :messages, only: :create
  end

  resources :bookings, except: %i[new create]

  resources :offers do
    resources :bookings, only: %i[new create]
  end

  resources :dashboard, only: [:index] do
    resources :offers, only: %i[edit update destroy]
    resources :bookings, only: %i[edit update destroy]
    # patch 'offers/:id/update', to: 'dashboard#update_offer', as: :update_offer
    # delete 'offers/:id/delete', to: 'dashboard#delete_offer', as: :delete_offer
    patch 'bookings/:id/accept', to: 'dashboard#accept_booking', as: :accept_booking
    # patch 'bookings/:id/reject', to: 'dashboard#reject_booking', as: :reject_booking
    # patch 'bookings/:id/confirm', to: 'dashboard#confirm_booking', as: :confirm_booking
  end

  get "profiles/:id", to: "pages#profiles", as: 'profile'
  post 'profiles/:id', to: "pages#createprofile"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
