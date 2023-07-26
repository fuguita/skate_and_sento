class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    @comment = PostComment.find(params[:id])
    @comment.destroy
    redirect_to request.referer, notice: "コメントを削除しました"
  end
end
