class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to new_user_session_path
    end 
    @user = User.find(params[:id])
  end
  
  def update
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to new_user_session_path
    end 
    
    @eser = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end 
  
  def index
    @users = User.all
  end 
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end 
  
end 
