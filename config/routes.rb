Rails.application.routes.draw do
  root 'posts#index'

  get "posts", to: "posts#all"
  get "posts/new"

  post "posts/save"

  get "info_pages/about_me"
  # match ':controller(/:action(/:id))', :via => :get
end
