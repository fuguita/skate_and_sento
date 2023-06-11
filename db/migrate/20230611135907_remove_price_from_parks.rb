class RemovePriceFromParks < ActiveRecord::Migration[6.1]
  def change
    remove_column :parks, :price, :integer
  end
end
