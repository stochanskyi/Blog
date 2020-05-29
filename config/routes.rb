Rails.application.routes.draw do
  root 'auth#index'

  get "posts", to: "posts#all"
  get "posts/new"

  post "posts/save"

  get "about_me", to: "info_pages#about_me"

  post "auth/login"
  post "auth/logout"
  post "auth/register_user"

  get "auth/index"
  get "auth/registration"
  # match ':controller(/:action(/:id))', :via => :get
end
