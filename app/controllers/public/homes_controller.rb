class Public::HomesController < ApplicationController
  def top
    # @average = Park.park_reviews.average(:star)
    # @parks = Park.all
    # @park_averages = @parks.each do |park|
    #                  park.park_reviews.average(:star)
    #                  end
    # @park_averages = Park.all.order('count(star_id) desc').limit(3)

    # order('count(star_id) desc')
    @park_averages = Park.joins(:park_reviews).group(:id).order("avg(park_reviews.star) desc").limit(3)
    @sento_averages = Sento.joins(:sento_reviews).group(:id).order("avg(sento_reviews.star) desc").limit(3)

    # @park_averages =
    # @park_reviews = @parks.star_count.limit(3)
  end

  def about
  end
end
