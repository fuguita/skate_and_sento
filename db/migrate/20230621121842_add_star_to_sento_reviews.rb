class AddStarToSentoReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :sento_reviews, :star, :string
  end
end
