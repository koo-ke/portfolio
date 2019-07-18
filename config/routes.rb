Rails.application.routes.draw do


  devise_for :users

  root 'portfolio#index'
  
  resources :portfolio do
    collection do
      get :information
      get :profile
    end
  end


end