class UsersController < ApplicationController
    
    def index
     　@users = User.all
     　@user = current_
    end

   def show
     @user = User.find(params[:id])
     @book = Book.new
     @books = @user.books
   end

   def edit
   end
end

