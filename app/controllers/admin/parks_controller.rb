class Admin::ParksController < ApplicationController
  before_action :authenticate_admin!

    def new
      @park = Park.new
    end

    def create
      # section_ids = params[:park][:section_ids]
      # park_params.delete(:section_ids)
      @park = Park.new(park_params)
    if @park.save
      # section_ids.each do |section_id|
      #   next if section_id.blank?
      #   ParkSection.create(park_id: @park.id, section_id: section_id)
      redirect_to admin_park_path(@park)
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
      @park.update(park_params)
      redirect_to admin_park_path(@park)
    end

    private
    def park_params
      params.require(:park).permit(:prefecture_id, :name, :introduction, :address, :postal_code, :telephone_number, :business_hour, :holiday, :price, :parking, :helmet, :is_active, :sento_ids, park_tag_ids: [], park_images: [], section_ids: [])
    end
end