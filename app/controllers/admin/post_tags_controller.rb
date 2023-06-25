class Admin::PostTagsController < ApplicationController
  before_action :authenticate_admin!

    def create
      @post_tag = PostTag.new(post_tag_params)
      @post_tag.save
      redirect_to request.referer
    end

    def index
      @post_tag = PostTag.new
      @post_tags = PostTag.all
    end

    def edit
      @post_tag = PostTag.find(params[:id])
    end

    def update
      @post_tag = PostTag.find(params[:id])
      @post_tag.update(post_tag_params)
      redirect_to admin_post_tags_path
    end

    private

    def post_tag_params
      params.require(:post_tag).permit(:name)
    end

end
