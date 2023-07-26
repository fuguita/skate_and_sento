class Admin::ParkTagsController < ApplicationController
  before_action :authenticate_admin!
  def create
    @park_tag = ParkTag.new(park_tag_params)
    if @park_tag.save
      redirect_to request.referer, notice: "タグを追加しました！"
    else
      @park_tags = ParkTag.all
      render "index"
    end
  end

  def index
    @park_tag = ParkTag.new
    @park_tags = ParkTag.all
  end

  def edit
    @park_tag = ParkTag.find(params[:id])
  end

  def update
    @park_tag = ParkTag.find(params[:id])
    if @park_tag.update(park_tag_params)
      redirect_to admin_park_tags_path, notice: "タグを変更しました！"
    else
      render "edit"
    end
  end

    private
      def park_tag_params
        params.require(:park_tag).permit(:name)
      end
end
