class Public::SentoReviewsController < ApplicationController

  def create
   sento = Sento.find(params[:sento_id])
   @review = current_user.sento_reviews.new(sento_review_params)
   @review.sento_id = sento.id
   @review.save
   redirect_to request.referer
  end

  private

  def sento_review_params
    params.require(:sento_review).permit(:comment, :star)
  end

end
