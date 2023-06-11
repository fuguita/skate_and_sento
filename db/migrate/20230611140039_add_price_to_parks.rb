class AddPriceToParks < ActiveRecord::Migration[6.1]
  def change
    add_column :parks, :price, :text
  end
end
