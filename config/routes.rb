Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end  
  resources :users, only: [:delete, :show, :edit, :update]
  root "homes#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
