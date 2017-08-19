Rails.application.routes.draw do
  resources :statuses
  resources :orders
  resources :carts
  resources :products
  get 'inventario', to: 'products#stocks'
  get 'carritos-abandonados', to: 'carts#losts'
  delete 'logout', to: 'users#sign_out'
  get 'ordenes', to: 'orders#orders'
  resources :statuses
  #delete 'remove-cart/:id_product/:id_cart', to: 'in_shopping_carts#remove-cart'
  resources :suppliers
  resources :brands
  resources :in_shopping_carts, only: [:create, :destroy]
  root 'products#index'
  post 'create-order/:id_cart/:user', to: 'orders#newOrder', as: 'nueva_factura'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  get '/login', to: 'users#login'

  post '/sign_in', to: 'users#sign_in'
end
