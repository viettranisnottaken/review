Rails.application.routes.draw do
  get "/login", to: 'sessions#new'
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get 'static_pages/new'
  get "/signup", to: "users#new"
  get 'users/edit'
  get 'users/show'
  get 'users/index'
  root 'static_pages#home'
  get 'static_pages/help'
  get 'static_pages/about'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
