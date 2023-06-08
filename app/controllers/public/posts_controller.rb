class Public::PostsController < ApplicationController

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to request.referer
  end

  def index
    @post = Post.new
    @posts = Post.page(params[:page]).order(created_at: :desc)
    @user = @post.user_id

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to my_page_users_path(current_user)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :prefecture_id, :park, :sento, :park_caption, :sento_caption, :post_park_image, :post_sento_image)
  end

end
