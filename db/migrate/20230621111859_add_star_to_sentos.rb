class AddStarToSentos < ActiveRecord::Migration[6.1]
  def change
    add_column :sentos, :star, :string
  end
end
