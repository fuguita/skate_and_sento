class AddStarToParkReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :park_reviews, :star, :string
  end
end
