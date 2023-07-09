class Public::SearchesController < ApplicationController

  def search
        @word = params[:word]
        @model = params[:model]
          if @model == "Park"
            @records = Park.search_for(@word).page(params[:page]).per(10).order(created_at: :desc)
          else
            @records = Sento.search_for(@word).page(params[:page]).per(10).order(created_at: :desc)
          end
  end
end
