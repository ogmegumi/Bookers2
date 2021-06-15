class UsersController < ApplicationController
    def index
      @user = User.new
      @users = User.all
    end
    
    def create
     @user = User.new(user_image_params)
     @user.user_id = current_user.id
     @user.save
     redirect_to edit_user_path
    end
  
    def show
      @user = User.find(params[:id])
    end
    
    def edit
      @user = User.find(params[:id])
    end
    
    def update
      @user = User.find(params[:id])
      @user.update(user_params)
      redirect_to edit_path(@user)
    end
    
    private
    
    def user_image_params
      params.require(:user_image).permit(:name, :profile_image, :introduction)
    end
    
end
