class Public::PostCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_user, only: [:destroy]

  def create
    # byebug
    @post = Post.find(params[:post_id])
    @comment = current_user.post_comments.new(post_comment_params)
    @comment.post_id = @post.id
    if @comment.save
      @post_comment = PostComment.new
      flash.now[:notice_message] = "コメントを投稿しました！"
      render :create
    else
      render :error
    end
  end

  def destroy
    @comment = PostComment.find(params[:id])
    if @comment.destroy!
      flash.now[:notice_message] = "コメントを削除しました！"
      @post = Post.find(params[:post_id])
      @post_comment = current_user.post_comments.new
    else
      flash.now[:notice_message] = "コメントを削除できませんでした。！"
    end
    render :create
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

  def ensure_user
    @comment = PostComment.find(params[:id])
    if current_user.id != @comment.user_id
      redirect_to posts_path
    end
  end

end
