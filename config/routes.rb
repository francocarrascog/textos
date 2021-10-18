Rails.application.routes.draw do

  devise_for :users
  resources :posts
  get 'public/home'
  root to: "public#home"
  resources :tags
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
