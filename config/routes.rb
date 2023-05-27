Rails.application.routes.draw do
  devise_for :users
  root to: "offers#index"

  get "/map", to: "pages#map"

  resources :offers

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
