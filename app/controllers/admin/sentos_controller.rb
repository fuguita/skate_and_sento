class Admin::SentosController < ApplicationController
  before_action :authenticate_admin!

  def new
    @sento = Sento.new
  end

  def create
    @sento = Sento.new(sento_params)
    if @sento.save
      redirect_to admin_sento_path(@sento), notice: "銭湯が新規登録されました"
    else
      render :new
    end
  end

  def index
    @sentos = Sento.page(params[:page]).per(10).order(created_at: :desc)
  end

  def show
    @sento = Sento.find(params[:id])
  end

  def edit
    @sento = Sento.find(params[:id])
  end

  def update
    @sento = Sento.find(params[:id])
    if @sento.update(sento_params)
      redirect_to admin_sento_path(@sento), notice: "変更しました"
    else
      render :edit
    end
  end

    private
      def sento_params
        params.require(:sento).permit(:prefecture_id, :name, :introduction, :address, :postal_code, :telephone_number, :business_hour, :holiday, :price, :parking, :sauna, :temperature, :towel, :soap, :open_air_bath, :cold_bath, :is_active, :park_ids, sento_tag_ids: [], sento_images: [])
      end
end
