class Public::UsersController < ApplicationController

  def posts
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(5).order(created_at: :desc)
    @post_comment = PostComment.new
  end

  def my_page
    @posts = current_user.posts.page(params[:page]).per(5).order(created_at: :desc)
  end

  def park_favorites
    @favorite_parks = current_user.park_favorites.page(params[:page]).per(9).order(created_at: :desc)
  end

  def sento_favorites
    @favorite_sentos = current_user.sento_favorites.page(params[:page]).per(9).order(created_at: :desc)
  end

  def edit

  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to my_page_users_path(current_user), notice: '変更しました'
    else
      render 'edit'
    end

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
