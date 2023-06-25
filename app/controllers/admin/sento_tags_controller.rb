class Admin::SentoTagsController < ApplicationController
  before_action :authenticate_admin!

    def create
      @sento_tag = SentoTag.new(sento_tag_params)
      @sento_tag.save
      redirect_to request.referer
    end
  
    def index
      @sento_tag = SentoTag.new
      @sento_tags = SentoTag.all
    end
  
    def edit
      @sento_tag = SentoTag.find(params[:id])
    end
  
    def update
      @sento = SentoTag.find(params[:id])
      @sento.update(sento_tag_params)
      redirect_to admin_sento_tags_path
    end
  
    private
  
    def sento_tag_params
      params.require(:sento_tag).permit(:name)
    end

end

