class Admin::ParkTagsController < ApplicationController
  before_action :authenticate_admin!
    def create
      @park_tag = ParkTag.new(park_tag_params)
      @park_tag.save
      redirect_to request.referer
    end

    def index
      @park_tag = ParkTag.new
      @park_tags = ParkTag.all
    end

    def edit
      @park_tag = Park_tag.find(params[:id])
    end

    def update
      @park_tag = ParkTag.find(params[:id])
      @park_tag.update(park_tag_params)
      redirect_to request.referer
    end

    private

    def park_tag_params
      params.require(:park_tag).permit(:name)
    end

end
