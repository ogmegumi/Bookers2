class UsersController < ApplicationController
    def index
      @book = Book.new
      @books = Book.all
      @users = User.all
      @user = current_user
      @book = current_user #本のユーザーと現在のユーザーの関係性
    end
    
    # def create
    # @user.user_id = current_user.id
    # @user.save
    # redirect_to edit_user_path
    # end
  
    def show
      @user = User.find(params[:id])
      @book = Book.new
      @books = @user.books
    end
    
    def edit
      @user = User.find(params[:id])
    end
    
    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:notice] = "You have updated user successfully"
        redirect_to user_path(@user)
      else
       render 'edit'
    end
    
    private
    
    def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
    end
    
end
