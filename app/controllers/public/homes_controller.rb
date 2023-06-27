class Public::HomesController < ApplicationController

  def top

    # @average = Park.park_reviews.average(:star)
    @parks = Park.all
    @park_averages = @parks.each do |park|
                      park.park_reviews.average(:star)
                      end
          # @park_averages = Park.all.order('count(star_id) desc').limit(3)

                      # order('count(star_id) desc')


    # @park_averages =
    # @park_reviews = @parks.star_count.limit(3)
  end

  def about
  end



end
