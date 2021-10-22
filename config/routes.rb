Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/radmin', as: 'rails_admin'
  resources :comments
  resources :addresses
  resources :line_items
  post 'line_items/:id/add' => 'line_items#add_quantity', as: 'line_item_add'
  post 'line_items/:id/cr' => 'line_items#update', as: 'line_item_cr'

  get 'search_word/:q' => 'pages#search'
  
  resources :categories do 
    resources :items 
  end
  
  resources :carts
  resources :items 
  resources :orders
  #get '/carts' => 'cart#show', as: 'carts'
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do
    resources :carts
  end
  
  root 'store#index' #, as: 'store'
  
  post '/orders' => 'orders#create', as: 'create_order'
  
  #Admin Routes
  resources :admin, only: [:index]
  get '/items_index' => 'admin#items', as: 'admin_items'
  get '/orders_index' => 'admin#orders', as: 'admin_orders'
  get '/show_order/:id' => 'admin#show_order'
  get '/admin_order/:id' => 'orders#admin_order'

  #Pages Routes
  get '/bicycles' => 'pages#bike'
  get '/parts' => 'pages#part'
  get '/accessories' => 'pages#accessory'
  get '/about' => 'pages#about'
  
  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
