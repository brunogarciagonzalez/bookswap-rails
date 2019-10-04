Rails.application.routes.draw do
  resources :sessions, only: [:create, :destroy]
  resources :user_books, only: [:create, :destroy]
end
