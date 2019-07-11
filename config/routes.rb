Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get "/login", to: 'sessions#new'
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get 'static_pages/new'
  get "/signup", to: "users#new"
  root 'static_pages#home'
  get 'static_pages/help'
  get 'static_pages/about'

  resources :users
  resources :account_activations
  resources :password_resets
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
