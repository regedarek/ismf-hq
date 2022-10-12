Rails.application.routes.draw do
  root "pages#home"

  devise_for :users,
    controllers: { sessions: "devise/passwordless/sessions" }

  devise_scope :user do
    get "/users/magic_link",
      to: "devise/passwordless/magic_links#show",
      as: "users_magic_link"
  end

  resources :questions
end
