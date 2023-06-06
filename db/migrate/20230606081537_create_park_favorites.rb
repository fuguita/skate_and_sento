class CreateParkFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :park_favorites do |t|
      
      t.integer :park_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
