class Public::UsersController < ApplicationController

before_action :check_guest_user, only: [:edit]

  def posts
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(5).order(created_at: :desc)
    @post_comment = PostComment.new
  end

  def my_page
    @posts = current_user.posts.page(params[:page]).per(5).order(created_at: :desc)
  end

  def park_favorites
    @favorite_parks = ParkFavorite.eager_load(:park).where(parks: { is_active: true }).where(user_id: current_user.id).page(params[:page]).per(9).order(created_at: :desc)
  end

  def sento_favorites
    @favorite_sentos = SentoFavorite.eager_load(:sento).where(sentos: { is_active: true }).where(user_id: current_user.id).page(params[:page]).per(9).order(created_at: :desc)

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

  def check_guest_user
    if current_user.email == "guest@example.com"
      redirect_to request.referer, notice: "ゲストユーザーはアカウントの編集はできません"
    end
  end

end
