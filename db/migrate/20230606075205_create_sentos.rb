class CreateSentos < ActiveRecord::Migration[6.1]
  def change
    create_table :sentos do |t|
      
      t.integer :prefecture_id, null: false
      t.string :name, null: false
      t.text :introduction, null: false
      t.string :address, null: false
      t.string :postal_code, null: false
      t.string :telephone_number, null: false
      t.string :business_hour, null: false
      t.string :holiday, null: false
      t.integer :price, null: false
      t.string :parking, null: false
      t.boolean :sauna, null: false, default: true
      t.integer :temperature, null: false
      t.string :towel, null: false
      t.string :soap, null: false
      t.boolean :open_air_bath, null: false, default: true
      t.boolean :cold_bath, null: false, default: true
      t.boolean :is_active, null: false, default: true
      # t.string :near_sento, null: false
      

      t.timestamps
    end
  end
end
