Rails.application.routes.draw do
  get 'books/users'
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  resources :users, only: [:index, :show, :update, :edit]
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
