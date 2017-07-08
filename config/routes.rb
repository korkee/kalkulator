Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)
  root 'home#index'
  
  resources :products
  resources :meals
  resources :plans
  get 'home/about'
end
