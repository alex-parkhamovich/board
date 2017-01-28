Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :profiles, only: [:show]
  resources :categories

  root 'posts#index'
end
