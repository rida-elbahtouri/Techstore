Rails.application.routes.draw do
  devise_for :users,:controllers => {:registrations => "registrations"}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "products#index"
  resources :products
  resources :comments
  resources :cus_details
  resources :sel_details
  resources :both_details
  resources :baskets
  resources :orders

  get '/category/:cat',to: "products#category"
  get '/search',to: "products#search",as: :search
  get '/productscard/:id',to: "products#productdata"
  get 'profile',to: "users#show",as: :user
  # get '/details/both',to: "userdetails#new_both"
  # get '/details/customer',to: "userdetails#new_customer"
  # get '/details/seller',to: "userdetails#new_seller"

end
