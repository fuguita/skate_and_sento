class Public::ParkReviewsController < ApplicationController
  before_action :authenticate_user!

    def create
          @park = Park.find(params[:park_id])
          @review = current_user.park_reviews.new(park_review_params)
          @review.park_id = @park.id
       if @review.save
          redirect_to request.referer, notice: 'レビューを投稿しました！'
       else
          @park_review = @review
          @user = @park_review.user
          @park_reviews = @park.park_reviews.page(params[:page]).per(5).order(created_at: :desc)
          render 'public/parks/reviews'
       end
    end

    private

    def park_review_params
      params.require(:park_review).permit(:comment, :star)
    end

end
