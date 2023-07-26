class Admin::SentoTagsController < ApplicationController
  before_action :authenticate_admin!

  def create
    @sento_tag = SentoTag.new(sento_tag_params)
    if @sento_tag.save
      redirect_to request.referer, notice: "タグを追加しました！"
    else
      @sento_tags = SentoTag.all
      render "index"
    end
  end

  def index
    @sento_tag = SentoTag.new
    @sento_tags = SentoTag.all
  end

  def edit
    @sento_tag = SentoTag.find(params[:id])
  end

  def update
    @sento_tag = SentoTag.find(params[:id])
    if @sento_tag.update(sento_tag_params)
      redirect_to admin_sento_tags_path, notice: "タグを変更しました！"
    else
      render "edit"
    end
  end

    private
      def sento_tag_params
        params.require(:sento_tag).permit(:name)
      end
end
