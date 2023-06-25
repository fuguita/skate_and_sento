class Public::ParkFavoritesController < ApplicationController
  before_action :authenticate_user!

    def create
      park = Park.find(params[:park_id])
      current_user.park_favorite(park)
      flash[:notice] = 'お気に入りに追加しました！'
      redirect_to request.referer
    end

    def destroy
      park = current_user.park_favorites.find(params[:id]).park
      current_user.unpark_favorite(park)
      flash[:notice] = 'お気に入りを外しました！'
      redirect_to request.referer
    end

end
