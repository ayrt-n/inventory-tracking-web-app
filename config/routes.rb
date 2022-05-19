Rails.application.routes.draw do
  resources :inventories, only: [:index, :show]
  resources :products, only: [:new, :create, :edit, :update, :destroy]
  resources :shipments
  root 'inventories#index'
end
