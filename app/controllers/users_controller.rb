class UsersController < ApplicationController
  def index
    @user = findUser
  end

  def show
    @user = findUser
  end

  def edit
  end

  def new
  end

  def create
  end

  def update
  end

  def delete
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def findUser
    @user = User.find_by( id: session[:user_id].to_i)
  end
end
