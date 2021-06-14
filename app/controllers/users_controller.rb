class UsersController < ApplicationController
    
  def index
    @user = User.all
    @user = User.new
    @user = current_user
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def show
    @user = User.find(params[:id])
  end
  



end
