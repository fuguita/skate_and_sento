class CreateParkSentos < ActiveRecord::Migration[6.1]
  def change
    create_table :park_sentos do |t|
      t.integer :park_id, null: false
      t.integer :sento_id, null: false

      t.timestamps
    end
  end
end
