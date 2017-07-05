Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
 
  resources :products
  resources :meals
  
  get 'home/about'
end
