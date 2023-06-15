class Public::ParksController < ApplicationController
  
  def index
    # if params[:word].present?
    #   @parks = Park.where(word: params[:word])
    # elsif params[:tags].present?
    #   @parks = Park.where(tag: params[:tag])
    # else
      @parks = Park.all
  end

  def show
    @park = Park.find(params[:id])
  end
end
