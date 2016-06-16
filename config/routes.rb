Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users
  resources :posts

  get 'user_posts/:user_id' => 'posts#user', as: :user_posts

end
