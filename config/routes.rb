Rails.application.routes.draw do
  get 'follows/create'
  get 'follows/destroy'
  devise_for :users
  root to: "offers#index"
  resources :offers

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
