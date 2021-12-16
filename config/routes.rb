Rails.application.routes.draw do
  resources :items, only: [:index, :create] do
    resources :user
  end
  resources :users, only: [:show, :index] do
    resources :items
  end
  
end
