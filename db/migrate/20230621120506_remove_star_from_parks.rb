class RemoveStarFromParks < ActiveRecord::Migration[6.1]
  def change
    remove_column :parks, :star, :string
  end
end
