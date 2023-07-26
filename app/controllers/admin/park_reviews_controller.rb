class Admin::ParkReviewsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @park_reviews = ParkReview.all.page(params[:page]).per(10).order(created_at: :desc)
  end

  def destroy
    park_review = ParkReview.find(params[:id])
    park_review.destroy
    redirect_to request.referer, notice: "レビューを削除しました"
  end
end
