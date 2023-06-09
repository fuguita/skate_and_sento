class Admin::SentosController < ApplicationController

  def new
    @sento = Sento.new
  end

  def create
    @sento = Sento.new(sento_params)
    @sento.save
    redirect_to admin_sentos_path
  end

  def index
    @sentos = Sento.page(params[:page]).order(created_at: :desc)
  end

  def show
  end

  def edit
  end

  def update
  end

  private
  def sento_params
    params.require(:sento).permit(:prefecture_id, :name, :introduction, :address, :postal_code, :telephone_number, :business_hour, :holiday, :price, :parking, :sauna, :temperature, :towel, :soap, :open_air_bath, :cold_bath, :is_active, sento_image: [])
  end

end
