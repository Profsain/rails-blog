Rails.application.routes.draw do
  devise_for :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
  resources :posts, only: [:index, :show, :new, :create]
  resources :comments, only: [:new, :create]
  resources :likes, only: [:create]
  root "users#index"
end
