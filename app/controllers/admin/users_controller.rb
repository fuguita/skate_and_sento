class Admin::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def posts
    @user = User.find(params[:id])
    @posts = @user.posts
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
    redirect_to admin_user_path
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :is_deleted)
  end

end
