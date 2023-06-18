class Public::ParksController < ApplicationController

  def index
    # @parks = params[:park_tag_id].present? ? ParkTag.find(params[:park_tag_id]).parks : Park.all
    if params[:park_tag_id].present?
      @tag = ParkTag.find(params[:park_tag_id])
      @parks = @tag.parks
    else
      @parks = Park.all
    end
    
    
    # if params[:word].present?
    #   @parks = Park.where(word: params[:word])
    # elsif params[:tags].present?
    #   @parks = Park.where(tag: params[:tag])
    # else
  end

  def show
    @park = Park.find(params[:id])
  end
end
