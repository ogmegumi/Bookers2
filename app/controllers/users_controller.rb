class UsersController < ApplicationController
    before_action :correct_user, only:[:edit, :update]
  
    def index
      @book = Book.new
      @books = Book.all
      @users = User.all
      @user = current_user
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
      # if @user = current_user
        # redirect_to user_path(@user.id)
      # else
        # render 'show'
      # end
    end
    
    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:notice] = "You have updated user successfully"
        redirect_to user_path(@user.id)
      else
        render 'edit'
      end
    end
    
    private
    
    def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
    end
    
    def correct_user
      user = User.find(params[:id])
      if user != current_user #ひとしくない時！＝
      redirect_to user_path(current_user) #before actionでチェックしてるからelse不要
      end
    end
    
end
