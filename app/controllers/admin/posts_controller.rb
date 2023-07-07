class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

    def index
      @posts = Post.page(params[:page]).per(10).order(created_at: :desc)
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

