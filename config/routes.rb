Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  post "users/:id" => "users#show"
  get "home/about" => "homes#about"
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]

  resources :users, only: [:show, :edit, :update, :index, :create, :destroy]

end
