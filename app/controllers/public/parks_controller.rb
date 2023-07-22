class Public::ParksController < ApplicationController
before_action :authenticate_user!, only: [:reviews]

  def index
    # @parks = params[:park_tag_id].present? ? ParkTag.find(params[:park_tag_id]).parks : Park.all
    if params[:park_tag_id].present?
      @tag = ParkTag.find(params[:park_tag_id])
      @parks = @tag.parks.active.page(params[:page]).per(10).order(created_at: :desc)
    else
      @parks = Park.active.page(params[:page]).per(10).order(created_at: :desc)
      @active_park_count = Park.active.count
    end
    # if params[:word].present?
    #   @parks = Park.where(word: params[:word])
    # elsif params[:tags].present?
    #   @parks = Park.where(tag: params[:tag])
    # else
  end

  def show
    @park = Park.find(params[:id])
    @average_score = ParkReview.left_joins(:user).where(park_id: @park.id).where(user:{is_deleted: false}).average(:star).to_f.round(1)
    if @park.is_active == false
     return render "/public/parks/not_show"
    end
  end

  def reviews
    @park = Park.find(params[:id])
    @park_review = ParkReview.new
    @user = @park_review.user
    @average_score = ParkReview.left_joins(:user).where(park_id: @park.id).where(user:{is_deleted: false}).average(:star).to_f.round(1)
    @park_reviews = ParkReview.left_joins(:user).where(park_id: @park.id).where(user:{is_deleted: false}).page(params[:page]).per(5).order(created_at: :desc)
  end

end
