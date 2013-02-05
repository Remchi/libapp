Libapp::Application.routes.draw do
  get "/register", to: "readers#new", as: "register"
  get "/login", to: "sessions#new", as: "login"
  get "/logout", to: "sessions#destroy", as: "logout"

  resources :readers
  resources :sessions

  root to: "home#index"
end
