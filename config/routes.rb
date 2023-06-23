Rails.application.routes.draw do
    devise_for :users
  get 'homes/top'
  get 'home/about' =>'homes#about',as: "about"
  resources :users, only: [:show, :edit, :index]
  resources :books, only: [:new, :index, :show, :create, :edit ]
  get 'users' => 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
