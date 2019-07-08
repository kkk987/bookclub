Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "books#index"
  get "/books", to: "books#index", as: "books"
  get "/books/new", to: "books#new", as: "new_book"
  get "/books/add", to: "books#add", as: "add_book_to_list"
  post "books", to: "books#create", as: "create_new_book"
  get "/books/:id", to: "books#show", as: "book"
  delete "/books/:id", to: "book_list_item#destroy", as: "delete_book"
  get "/authors", to: "authors#index", as: "authors"
  get "/authors/:id", to: "authors#show", as: "author"
  get "/mylist", to: "book_list_item#index", as: "book_list_items"
  put "/mylist/:id", to: "book_list_item#update"
  get "/mylist/:id/edit", to: "book_list_item#edit", as: "edit_book_list_item"
  patch "/mylist/:id", to: "book_list_item#update", as: "book_list_item"
  get "/reviews/new", to: "reviews#new", as: "new_review"
  post "/reviews", to: "reviews#create"
  post "follow/:user_id", to: "relationships#create", as: "follow_user"
end
