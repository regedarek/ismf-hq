Rails.application.routes.draw do
  root "pages#home"

  devise_for :users,
    controllers: { sessions: "devise/passwordless/sessions" }

  devise_scope :user do
    get "/users/magic_link",
      to: "devise/passwordless/magic_links#show",
      as: "users_magic_link"
  end

  resources :users
  resources :race_editions
  resources :questions
  resources :answers, only: [] do
    get :check, on: :member
  end

    get "/cases/:id",
      to: "questions#public",
      as: :public_case
end
