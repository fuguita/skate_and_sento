class Public::ParkReviewsController < ApplicationController
  before_action :authenticate_user!

    def create
          @park = Park.find(params[:park_id])
          @review = current_user.park_reviews.new(park_review_params)
          @review.park_id = @park.id
       if @review.save
          redirect_to request.referer, notice: 'レビューを投稿しました！'
       else
          @park
          @park_review = @review
          @user = @park_review.user
          @park_reviews = ParkReview.all
          render 'public/parks/reviews'
       end
    end

    private

    def park_review_params
      params.require(:park_review).permit(:comment, :star)
    end

end
