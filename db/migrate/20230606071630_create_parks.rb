class CreateParks < ActiveRecord::Migration[6.1]
  def change
    create_table :parks do |t|
      
      t.integer :prefectures_id, null: false
      t.string :name, null: false
      t.text :introduction, null: false
      t.string :address, null: false
      t.string :postal_code, null: false
      t.string :telephone_number, null: false
      t.string :business_hour, null: false
      t.string :holiday, null: false
      t.string :price, null: false
      t.string :parking, null: false
      t.string :helmet, null: false
      t.boolean :is_active, null: false, default: true
      # t.string :near_sento, null: false

      t.timestamps
    end
  end
end
