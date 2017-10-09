Rails.application.routes.draw do
  root to: 'products#index'
  devise_for :customers
  resources :products
  mount Cartify::Engine, at: '/'
end
