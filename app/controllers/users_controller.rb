class UsersController < ApplicationController
  before_action :baria_user, only: [:edit, :update]

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = Book.where(user_id:@user.id)
    @following_users = @user.following_user
    @follower_users = @user.follower_user
  end

  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice:"You have updated user successfully."
    else
      render :edit
    end
  end
  
  def follows
    @users = User.find(params[:id]).following_user.all
  end
  
  def followers
    @users = User.find(params[:id]).follower_user.all
  end

  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def baria_user
    unless User.find(params[:id]).id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end
end
