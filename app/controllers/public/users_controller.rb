class Public::UsersController < ApplicationController

  def posts
    @user = User.find(params[:id])
    @posts = @user.posts
    @post_comment = PostComment.new
  end

  def my_page
    @posts = current_user.posts
  end

  def park_favorites
    @favorite_parks = current_user.favorite_parks.order(created_at: :desc)
  end

  def sento_favorites
    @favorite_sentos = current_user.favorite_sentos.order(created_at: :desc)
  end

  def edit

  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to my_page_users_path(current_user)
  end

  def unsubscribe

  end

  def withdraw
   current_user.update(is_deleted: true)
   reset_session
   redirect_to root_path


  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
