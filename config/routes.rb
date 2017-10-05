Cartify::Engine.routes.draw do
  resource :cart, only: %i[show update]
  resources :order_items, only: %i[create update destroy]
  resources :orders, only: %i[index show]
end
