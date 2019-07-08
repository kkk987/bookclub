class BookListItemController < ApplicationController
  before_action :authenticate_user!
  def index
    @books = current_user.books
    # BookListItem.book_for_current_user(current_user)
  end

  def destroy
    # item_id = BookListItem.book_list_item_id(current_user,params[:id])
    # BookListItem.destroy(item_id)

    book_id = params[:id]
    user_id = current_user.id
    BookListItem.where(book_id: params[:id], user_id: current_user.id).first.destroy

    redirect_to book_list_items_path 
  end

  def edit
    # @book_list_item = BookListItem.find(BookListItem.book_list_item_id(current_user,params[:id]))

    @book_list_item = BookListItem.where(book_id: params[:id], user_id: current_user.id).first
  end

  def update
    book_list_item = BookListItem.find(params[:id])
    available_for_trade = params[:book_list_item][:for_trade]

    if available_for_trade == "1"
      book_list_item.for_trade = true
    else
      book_list_item.for_trade = false
    end

    if book_list_item.save
      flash[:alert] = "Your changes have been saved"
    else
      flash[:alert] = "There was an error with your change"
    end
    redirect_to book_path(book_list_item.book.id)
  end

end
