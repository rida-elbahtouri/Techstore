Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'products#index'
  resources :products
  resources :comments, only: [:create]
  resources :cus_details, only: %i[new create]
  resources :both_details, only: %i[new create]
  resources :baskets
  resources :orders, only: %i[update index create]
  resources :ratings, only: %i[update create]

  get '/category/:cat', to: 'products#category'
  get '/search', to: 'products#search', as: :search
  get '/productscard/:id', to: 'products#productdata'
  get 'profile', to: 'users#show', as: :user
  get 'history', to: 'orders#history', as: :history
end
