class RemoveStarFromSentos < ActiveRecord::Migration[6.1]
  def change
    remove_column :sentos, :star, :string
  end
end
