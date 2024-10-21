Rails.application.routes.draw do

  resources :tweets
  resources :users
  
  get 'top/main'
  post 'top/login'
  get 'top/logout'
  
  root 'top#main'
  
  resources :likes
end
