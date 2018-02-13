Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "pages#home"
  get 'pages/home', to: 'pages#home'
  resources :customers
  resources :orders
  #get 'orders/getdata', to: 'orders#getdata' 
   get 'items/getdata', to: 'items#getdata' 
   get 'items/getList', to: 'items#getList'
   get 'customers/info/:id', to: 'customers#info', as: 'customer_info'
   resources :items
   resources :products
end
