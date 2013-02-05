Libapp::Application.routes.draw do
  get "/register", to: "readers#new", as: "register"

  resources :readers

  root to: "home#index"
end
