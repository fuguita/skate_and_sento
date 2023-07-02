class Public::SentoFavoritesController < ApplicationController
  before_action :authenticate_user!

    def create
      @sento = Sento.find(params[:sento_id])
      current_user.sento_favorite(@sento)
      @favorite_sentos = current_user.favorite_sentos
      flash.now[:notice_message] = 'お気に入りに追加しました！'
    end

    def destroy
      @sento = current_user.sento_favorites.find(params[:id]).sento
      current_user.unsento_favorite(@sento)
      @favorite_sentos = current_user.favorite_sentos
      flash.now[:notice_message] = 'お気に入りを外しました！'
    end

end
