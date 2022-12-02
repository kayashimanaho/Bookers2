class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def new
    @books = Book.new
  end
  
  def create
    @books = Book.new(book_params)
    @books.user_id = current_user.id
    if @books.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@books.id)
    else
      @book_all = Book.all
      @user = current_user
      render :index
    end
  end
  
  def index
    @books = Book.new
    @book_all = Book.all
    @user = current_user
  end
  
  def show
    @books = Book.find(params[:id])
    @user = @books.user
    @book = Book.new
  end
  
  def edit
      @book = Book.find(params[:id])
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
  
  private

  def book_params
    params.require(:book).permit(:body, :title)
  end
  
  def is_matching_login_user
    @books = Book.find(params[:id])
    user_id = @books.user.id
    login_user_id = current_user.id
    if(user_id != login_user_id)
      redirect_to books_path
    end
  end
end