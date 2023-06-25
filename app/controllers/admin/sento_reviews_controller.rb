class Admin::SentoReviewsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @sento_reviews = SentoReview.all
  end

  def destroy
    sento_review = SentoReview.find(params[:id])
    sento_review.destroy
    redirect_to request.referer
  end

end
