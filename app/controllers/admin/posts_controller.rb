class Admin::PostsController < ApplicationController

  def index
    @posts = Post.all
    @users = User.all
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user_id
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to admin_posts_path

  end

  private
  def post_params
    params.require(:post).permit(:user_id, :prefecture_id, :park, :sento, :park_caption, :sento_caption, :post_park_image, :post_sento_image)
  end

end

