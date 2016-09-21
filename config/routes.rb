Rails.application.routes.draw do

  resources:users, only: [:new, :create]
  post 'users/create' 
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  
  root 'application#index'
  get 'terms' => 'application#terms'
  get 'pricing' => 'application#pricing'
  get 'sessions/new' => 'application#login'
  get 'explore' => 'application#explore'
end
