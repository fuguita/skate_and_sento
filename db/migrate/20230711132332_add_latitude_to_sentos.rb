class AddLatitudeToSentos < ActiveRecord::Migration[6.1]
  def change
    add_column :sentos, :latitude, :float
  end
end
