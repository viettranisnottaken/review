Rails.application.routes.draw do

  get 'laptops/index'
  get 'laptops/show'
  get '/laptops', to: 'laptops#index'
  get 'comments/edit'
  get '/microposts', to: 'microposts#index'
  get 'microposts/show'
  get 'microposts/edit'
  # get 'password_resets/new'
  # get 'password_resets/edit'
  resources :posts
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :users
  resources :microposts
  resources :relationships
  resources :comments
  resources :laptops
  resources :item_relationships

  get "/posts", to: "posts#index"
  root 'static_pages#home'
  # get  "/users", to: "users#index"
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
