class Admin::ParksController < ApplicationController

  def new
    @park = Park.new
    @park.sections.new

  end

  def create
    @park = Park.new(park_params)
   if @park.save
    redirect_to admin_park_path(@park)
   else
    render :new
   end
  end

  def index
    @parks = Park.page(params[:page]).order(created_at: :desc)
  end

  def show
    @park = Park.find(params[:id])

  end

  def edit
    @park = PARK.find(params[:id])
  end

  def update
    @park = Park.find(params[:id])
    @park.update(park_params)
    redirect_to admin_park_path(@park)
  end

  private
  def park_params
    params.require(:park).permit(:prefecture_id, :name, :introduction, :address, :postal_code, :telephone_number, :business_hour, :holiday, :price, :parking, :helmet, :is_active, park_sections_attributes: [:section_id, :name], park_images: [])
  end

end
