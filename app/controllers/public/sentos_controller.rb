class Public::SentosController < ApplicationController

  def index
    @sentos = params[:sento_tag_id].present? ? SentoTag.find(params[:sento_tag_id]).sentos : Sento.all
  end

  def show
    @sento = Sento.find(params[:id])
  end
end
