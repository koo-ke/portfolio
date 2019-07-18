Rails.application.routes.draw do


  devise_for :users

  root 'portfolio#index'
  
  resources :portfolio


end