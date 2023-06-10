class AddPriceToSentos < ActiveRecord::Migration[6.1]
  def change
    add_column :sentos, :price, :text
  end
end
