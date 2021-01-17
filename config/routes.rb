Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get 'home/about', to: 'homes#about'
  devise_for :users
  post 'users/:id' => 'books#create'
  post 'users' => 'books#create'
  # get 'users/:id' => 'users#show', as: 'home'
  resources :books
  resources :users,　only: [:show, :edit, :update]
  # only: [:show, :edit, :update]
end