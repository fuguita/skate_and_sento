class RemovePriceFromSentos < ActiveRecord::Migration[6.1]
  def change
    remove_column :sentos, :price, :integer
  end
end
