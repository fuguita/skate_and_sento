class Public::SentosController < ApplicationController
  before_action :authenticate_user!, only: [:reviews]

    def index
      #@sentos = params[:sento_tag_id].present? ? SentoTag.find(params[:sento_tag_id]).sentos : Sento.all
      if params[:sento_tag_id].present?
        @tag = SentoTag.find(params[:sento_tag_id])
        @sentos = @tag.sentos.active.page(params[:page]).per(10).order(created_at: :desc)
      else
        @sentos = Sento.active.page(params[:page]).per(10).order(created_at: :desc)
        @active_sento_count = Sento.active.count
      end
    end

    def show
      @sento = Sento.find(params[:id])
      @average_score = SentoReview.left_joins(:user).where(sento_id: @sento.id).where(user:{is_deleted: false}).average(:star).to_f.round(1)
      # if @sento.is_active == false
      #   return render "/public/sentos/not_show"
      # end
    end

    def reviews
      @sento = Sento.find(params[:id])
      @sento_review = SentoReview.new
      @user = @sento_review.user
      @average_score = SentoReview.left_joins(:user).where(sento_id: @sento.id).where(user:{is_deleted: false}).average(:star).to_f.round(1)
      @sento_reviews = SentoReview.left_joins(:user).where(sento_id: @sento.id).where(user:{is_deleted: false}).page(params[:page]).per(5).order(created_at: :desc)
    end

end
