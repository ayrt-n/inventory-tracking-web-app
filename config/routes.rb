Rails.application.routes.draw do
  resources :products
  resources :shipments
  root 'products#index'
end
