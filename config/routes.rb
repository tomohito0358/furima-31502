Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  # resources :registrations, only: [:new, :create, :show, :edit, :update, :destroy] do
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end