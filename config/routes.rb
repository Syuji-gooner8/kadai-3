Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :books
  root to: 'homes#top'
  get 'home/about' =>'homes#about',as: "about"
  get 'users' => 'users#index'
  delete '/books' => 'books#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
