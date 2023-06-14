class Public::ParkFavoritesController < ApplicationController

  def create
    park = Park.find(params[:park_id])
    current_user.park_favorite(park)
    redirect_to request.referer
  end

  def destroy
    park = current_user.park_favorites.find(params[:id]).park
    current_user.unpark_favorite(park)
    redirect_to request.referer
  end

end
