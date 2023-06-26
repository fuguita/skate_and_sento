class Public::HomesController < ApplicationController

  def top
    @parks = Park.star_count
    # @park_reviews = @parks.star_count.limit(3)
  end

  def about
  end



end
