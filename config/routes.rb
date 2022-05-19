Rails.application.routes.draw do
  resources :inventories
  resources :products, only: [:new, :create, :edit, :update, :destroy]
  root 'inventories#index'
end
