class Admin::ParkReviewsController < ApplicationController

  def index
    @park_reviews = ParkReview.all
  end

  def destroy
    park_review = ParkReview.find(params[:id])
    park_review.destroy
    redirect_to request.referer
  end
end
