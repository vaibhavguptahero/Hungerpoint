Rails.application.routes.draw do
  get 'my_orders/index'
  resources :carts
  resources :menu_items
  devise_for :users
  resources :restaurants do
    resources :comments
  end
  delete "cart_item/:id", to: "carts#cart_item_delete", as: "cart_item_delete"
  post "order/:id", to: "carts#order", as: "order"
  get "reorder/:id", to: "carts#reorder", as: "reorder"
  # delete "url", to: "controller#action_name", as: "path_name"
  root "restaurants#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "home#index"
end
