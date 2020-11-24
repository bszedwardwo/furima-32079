Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users, only: [:create, :delete, :new]
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy]
end
