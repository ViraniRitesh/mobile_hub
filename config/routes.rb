Rails.application.routes.draw do
  resources :line_items
  resources :carts
  resources :products
  resources :stores
  get 'gallery/index'
  get 'gallery/search'
  post 'gallery/search'
  get 'gallery/checkout'
  post 'gallery/checkout'
  get 'admin/login'
  devise_for :users
  get 'home/index'
  post 'admin/login'
  get 'admin/logout'
  get 'gallery/success'
  root 'gallery#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
