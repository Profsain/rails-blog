Rails.application.routes.draw do
  resource :users, only: [:index, :show] do
    resource :posts, only: [:index, :show]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
