class Public::SentosController < ApplicationController
  before_action :authenticate_user!, only: [:reviews]

    def index
      #@sentos = params[:sento_tag_id].present? ? SentoTag.find(params[:sento_tag_id]).sentos : Sento.all
      if params[:sento_tag_id].present?
        @tag = SentoTag.find(params[:sento_tag_id])
        @sentos = @tag.sentos.page(params[:page]).per(10)
      else
        @sentos = Sento.all.page(params[:page]).per(10)
      end
      # if params[:sento_tag_id].present?
      #   @sentos = Sento.where(sento_tags: params[:sento_tag_id])
      # else
      #   @sentos = Sento.all
      # end
    end

    def show
      @sento = Sento.find(params[:id])
    end

    def reviews
      @sento = Sento.find(params[:id])
      @sento_review = SentoReview.new
      @user = @sento_review.user
      @sento_reviews = @sento.sento_reviews.page(params[:page]).per(5).order(created_at: :desc)
    end

end
