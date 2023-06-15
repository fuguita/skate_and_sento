class Admin::SentosController < ApplicationController

  def new
    @sento = Sento.new

  end

  def create
    @sento = Sento.new(sento_params)
   if @sento.save
    redirect_to admin_sento_path(@sento)
   else
    render :new
   end
  end

  def index
    @sentos = Sento.page(params[:page]).order(created_at: :desc)
  end

  def show
    @sento = Sento.find(params[:id])

  end

  def edit
    @sento = Sento.find(params[:id])
  end

  def update
    @sento = Sento.find(params[:id])
    @sento.update(sento_params)
    redirect_to admin_sento_path(@sento)
  end

  private
  def sento_params
    params.require(:sento).permit(:prefecture_id, :name, :introduction, :address, :postal_code, :telephone_number, :business_hour, :holiday, :price, :parking, :sauna, :temperature, :towel, :soap, :open_air_bath, :cold_bath, :is_active, :park_ids, sento_tag_ids: [], sento_images: [])
  end

end
