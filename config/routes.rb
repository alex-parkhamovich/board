Rails.application.routes.draw do
  devise_for :users
  resources :posts
  
  namespace :profile do
    root 'posts#index'

    resources :categories, only: [:index]
    resources :users, only: [:index] 
    resources :posts, only: [:index] 
  end

  resources :categories

  root 'posts#index'
end
