class Admin::ParksController < ApplicationController
  before_action :authenticate_admin!

  def new
    @park = Park.new
  end

  def create
    @park = Park.new(park_params)
    if @park.save
      redirect_to admin_park_path(@park), notice: "パークが新規登録されました"
    else
      render :new
    end
  end

  def index
    @parks = Park.page(params[:page]).per(10).order(created_at: :desc)
  end

  def show
    @park = Park.find(params[:id])
  end

  def edit
    @park = Park.find(params[:id])
  end

  def update
    @park = Park.find(params[:id])
    if @park.update(park_params)
      redirect_to admin_park_path(@park), notice: "変更しました"
    else
      render :edit
    end
  end

    private
      def park_params
        params.require(:park).permit(:prefecture_id, :name, :introduction, :address, :postal_code, :telephone_number, :business_hour, :holiday, :price, :parking, :helmet, :is_active, :sento_ids, park_tag_ids: [], park_images: [], section_ids: [])
      end
end
