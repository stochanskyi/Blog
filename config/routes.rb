Rails.application.routes.draw do
  root 'posts#index'

  get "posts/new"
  post "posts/save"

end
