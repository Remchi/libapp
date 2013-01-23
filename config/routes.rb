Libapp::Application.routes.draw do
  get "/register", to: "readers#new", as: "register"
end
