class Public::PostCommentsController < ApplicationController
  before_action :authenticate_user!

    def create
      # byebug
            @post = Post.find(params[:post_id])
            @comment = current_user.post_comments.new(post_comment_params)
            @comment.post_id = @post.id
         if @comment.save
            flash.now[:notice_message] = 'コメントを投稿しました！'
            render :create
         else
            render :error
         end
  
    end
  
    def destroy
       @comment = PostComment.find(params[:id])
       @comment.destroy
       flash.now[:notice_message] = 'コメントを削除しました！'
       render :create
    end
  
    private
  
    def post_comment_params
      params.require(:post_comment).permit(:comment)
    end

end
