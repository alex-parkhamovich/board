Rails.application.routes.draw do
  devise_for :users
  resources :posts
  
  namespace :profile do
    root 'profiles#index'

    resources :categories, only: [:index]
    resources :profiles, only: [] do
      get :categories
    end
  end

  resources :categories

  root 'posts#index'
end
