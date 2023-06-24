class Public::SentosController < ApplicationController

  def index
    #@sentos = params[:sento_tag_id].present? ? SentoTag.find(params[:sento_tag_id]).sentos : Sento.all
    if params[:sento_tag_id].present?
      @tag = SentoTag.find(params[:sento_tag_id])
      @sentos = @tag.sentos
    else
      @sentos = Sento.all
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
    @sento_reviews = SentoReview.all.order(created_at: :desc)
  end

end
