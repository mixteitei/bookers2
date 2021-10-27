class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def index
  end
  
  
  private
  def user_params
    params.require(:user).permit(:name, :image)
  end
  
end
