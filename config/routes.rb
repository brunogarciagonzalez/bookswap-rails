Rails.application.routes.draw do
  resources :sessions, only: [:create, :destroy]
  resources :user_books, only: [:create, :destroy, :show]
  resources :books, only: [:index]
  get "/books/actives_only", to: "books#actives_only"
  
end
