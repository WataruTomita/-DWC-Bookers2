Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  devise_for :users
  get 'home/about', to: 'homes#about'
  post 'users/:id' => 'books#create'
  post 'books/:id' => 'books#create'
  resources :books
  resources :users
end