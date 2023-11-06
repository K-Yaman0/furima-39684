Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items, only: [:index, :new, :create, :edit, :update, :destroy, :show] do
    resources :orders, only: [:index, :create]
  end
end
