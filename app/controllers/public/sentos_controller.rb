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
      if @sento.is_active == false
        return render "/public/sentos/not_show"
      end
    end

    def reviews
      @sento = Sento.find(params[:id])
      @sento_review = SentoReview.new
      @user = @sento_review.user
      @sento_reviews = @sento.sento_reviews.page(params[:page]).per(5).order(created_at: :desc)
    end

end
