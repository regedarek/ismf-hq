Rails.application.routes.draw do
  resources :questions
  root "pages#home"

  resources :puzzles do
    post :check, on: :member
  end
  devise_for :users

  get 'pages/home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
