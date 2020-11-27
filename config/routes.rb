Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users, only: [:create, :delete, :new]
  resources :items, except: [:index] do
    resources :payment, only: [:create]
  end
end
