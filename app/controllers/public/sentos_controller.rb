class Public::SentosController < ApplicationController
  def index
    @sentos = Sento.all
  end

  def show
    @sento = Sento.find(params[:id])
  end
end
