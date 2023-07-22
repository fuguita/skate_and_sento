class Public::PostsController < ApplicationController
  before_action :authenticate_user!

    def create
          @post = Post.new(post_params)
          @post.user_id = current_user.id
       if @post.save
          redirect_to request.referer, notice: 'THANK YOU FOR YOUR SKATE AND SENTO!!'
       else
         @user = @post.user if @post.user.present?
         @post_comment = PostComment.new
         @posts = Post.page(params[:page]).per(5).order(created_at: :desc)
         render 'index'
       end
    end

    def index
        @post = Post.new
        @user = @post.user if @post.user.present?
        @post_comment = PostComment.new
        # @posts = params[:prefecture_id].present? ? Post.where(prefecture_id: params[:prefecture_id]) : Post.all.order(created_at: :desc)
      if params[:prefecture_id].present?
        # @posts = Post.where(prefecture_id: params[:prefecture_id]).page(params[:page]).per(5).order(created_at: :desc)
        @posts = Post.left_joins(:user).where(prefecture_id: params[:prefecture_id]).where(user:{is_deleted: false}).page(params[:page]).per(5).order(created_at: :desc)
      elsif params[:post_tag_id].present?
        @tag = PostTag.find(params[:post_tag_id])
        @posts = Post.left_joins(:user).where(post_tag_id: @tag.id).where(user:{is_deleted: false}).page(params[:page]).per(5).order(created_at: :desc)
        # @posts = @tag.posts.page(params[:page]).per(5).order(created_at: :desc)
      else
        @posts = Post.left_joins(:user).where(user:{is_deleted: false}).page(params[:page]).per(5).order(created_at: :desc)
      end
    end

    def edit
      @post = Post.find(params[:id])
    end

    def update
      @post = Post.find(params[:id])
   if @post.update(post_params)
      redirect_to my_page_users_path(current_user), notice: '投稿を変更しました'
   else
      render 'edit'
   end

    end

    def destroy
      post = Post.find(params[:id])
      post.destroy
      redirect_to posts_path, notice: '投稿を削除しました'
    end

    private
    def post_params
      params.require(:post).permit(:user_id, :prefecture_id, :park, :sento, :park_caption, :sento_caption, :post_park_image, :post_sento_image, post_tag_ids: [])
    end

end
