class BooksController < ApplicationController
  
  def new
    @books = Book.new
  end
  
  def create
    @books = Book.new(book_params)
    @books.user_id = current_user.id
    @books.save
    redirect_to books_path
  end
  
  def index
    @books = book
  end
  
  private

  def book_params
    params.require(:book).permit(:book, :image, :caption)
  end
end
