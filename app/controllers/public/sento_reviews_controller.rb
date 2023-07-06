class Public::SentoReviewsController < ApplicationController
  before_action :authenticate_user!

    def create
         @sento = Sento.find(params[:sento_id])
         @review = current_user.sento_reviews.new(sento_review_params)
         @review.sento_id = @sento.id
      if @review.save
         redirect_to request.referer, notice: 'レビューを投稿しました！'
      else
         @sento_review = @review
         @user = @sento_review.user
         @sento_reviews = @sento.sento_reviews.page(params[:page]).per(5).order(created_at: :desc)
         render 'public/sentos/reviews'
      end
    end

    private

    def sento_review_params
      params.require(:sento_review).permit(:comment, :star)
    end

end
