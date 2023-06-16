class Public::SentosController < ApplicationController

  def index
    @sentos = params[:sento_tag_id].present? ? SentoTag.find(params[:sento_tag_id]).sentos : Sento.all
    # if params[:sento_tag_id].present?
    #   @sentos = Sento.where(sento_tags: params[:sento_tag_id])
    # else
    #   @sentos = Sento.all
    # end
  end

  def show
    @sento = Sento.find(params[:id])
  end
end
