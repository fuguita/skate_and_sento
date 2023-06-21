class Public::ParkReviewsController < ApplicationController

  def create
    park = Park.find(params[:park_id])
    @review = current_user.park_reviews.new(park_review_params)
    @review.park.id = park.id
    @review.save
    redirect_to request.referer

  end

  private

  def park_review_params
    params.require(:park_review).permit(:comment, :star)
  end

end
