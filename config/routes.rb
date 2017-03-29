Rails.application.routes.draw do
  devise_for :users
  resources :blogs
  root 'posts#index'
end
