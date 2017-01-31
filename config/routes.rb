Rails.application.routes.draw do
  devise_for :users
  resources :posts
  
  namespace :profile do
    root 'posts#index'

    resources :categories, only: [:index, :new, :edit, :create, :update]
    resources :users, only: [:index] do
      get :posts
    end
    resources :posts, only: [:index]
  end

  root 'posts#index'
end
