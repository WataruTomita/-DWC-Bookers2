Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  root 'books#top'
  # get '/about', to: 'books#about'
  devise_for :users
  # post 'users/:id' => 'books#create'
  resources :books
  resources :users
  # only: [:show, :edit, :update]
end