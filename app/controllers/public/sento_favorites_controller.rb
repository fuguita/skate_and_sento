class Public::SentoFavoritesController < ApplicationController

  def create
    @sento = Sento.find(params[:sento_id])
    current_user.sento_favorite(@sento)
    flash.now[:notice_favorite] = 'お気に入りに追加しました！'
    # redirect_to request.referer
  end

  def destroy
    @sento = current_user.sento_favorites.find(params[:id]).sento
    current_user.unsento_favorite(@sento)
    flash.now[:notice_favorite] = 'お気に入りを外しました！'
    # redirect_to request.referer
  end

end
