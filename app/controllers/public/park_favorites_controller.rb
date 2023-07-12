class Public::ParkFavoritesController < ApplicationController
  before_action :authenticate_user!

    def create
      @park = Park.find(params[:park_id])
      current_user.park_favorite(@park)
      @favorite_parks = current_user.favorite_parks.page(params[:page]).per(9)
      flash.now[:notice_message] = 'お気に入りに追加しました！'
    end

    def destroy
      @park = current_user.park_favorites.find(params[:id]).park
      current_user.unpark_favorite(@park)
      @favorite_parks = current_user.favorite_parks.page(params[:page]).per(9)
      flash.now[:notice_message] = 'お気に入りを外しました！'
    end

end
