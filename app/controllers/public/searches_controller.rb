class Public::SearchesController < ApplicationController

  def search
        @word = params[:word]
        @model = params[:model]
          if @model == "Park"
            @records = Park.search_for(@word)
          else
            @records = Sento.search_for(@word)
          end
          
  end
end
