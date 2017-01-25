Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :persons

  root 'posts#index'
end
