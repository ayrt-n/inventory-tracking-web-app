Rails.application.routes.draw do
  resources :inventories
  root 'inventories#index'
end
