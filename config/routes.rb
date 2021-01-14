Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  devise_for :users
  post 'users/:id' => 'books#create'
  resources :books, only: [:new, :edit, :create, :index, :show, :destroy]
  resources :users, only: [:show, :edit, :update]
end
