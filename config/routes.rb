Rails.application.routes.draw do
  devise_for :users,:controllers => {:registrations => "registrations"}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "products#index"
  resources :products
  resources :cus_details


  # get '/details/both',to: "userdetails#new_both"
  # get '/details/customer',to: "userdetails#new_customer"
  # get '/details/seller',to: "userdetails#new_seller"

end
