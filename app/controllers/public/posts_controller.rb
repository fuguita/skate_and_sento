class Public::PostsController < ApplicationController

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def index
    @post = Post.new
    @posts = Post.page(params[:page]).order(created_at: :desc)

  end

  def edit
    @post = Post.find(parms[:id])
  end

  def update
  end

  def destroy
    post = Post.find(params:[:id])
    post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :prefecture_id, :park, :sento, :park_caption, :sento_caption, :post_park_image, :post_sento_image)
  end

end
