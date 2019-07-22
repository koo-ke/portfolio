Rails.application.routes.draw do


  resources :maps
  devise_for :users

  root 'portfolio#index'
  
  resources :portfolio do
    collection do
      get :information
      get :profile
    end
  end

  get 'experiment/googlemap' => 'experiment#googlemap'
  get 'experiment/easychat' => 'experiment#easychat'

end