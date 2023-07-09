class Admin::SentoReviewsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @sento_reviews = SentoReview.all.page(params[:page]).per(10).order(created_at: :desc)
  end

  def destroy
    sento_review = SentoReview.find(params[:id])
    sento_review.destroy
    redirect_to request.referer, notice: "レビューを削除しました"
  end

end
