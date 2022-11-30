class BooksController < ApplicationController
  
  def new
    @books = Book.new
  end
  
  def create
    @books = Book.new(book_params)
    @books.user_id = current_user.id
    @books.save
    redirect_to book_path(@books.id)
  end
  
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end
  
  def show
    @books = Book.find(params[:id])
    @user = @books.user
    @book = Book.new
  end
  
  def edit
    @books = Book.find(params[:id])
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  def update
    @books = Book.find(params[:id])
    @books.update(book_params)
    redirect_to book_path(@books.id)
  end
  
  private

  def book_params
    params.require(:book).permit(:body, :title)
  end
end