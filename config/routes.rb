Rails.application.routes.draw do
  root 'portfolio#index'
  resources :portfolio
end