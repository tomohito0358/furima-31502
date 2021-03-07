Rails.application.routes.draw do

  get 'items/index' => 'items#index' 
  post 'items/new' => 'items#new'
  devise_for :users
  root to: "items#index"
  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
  end
  
end