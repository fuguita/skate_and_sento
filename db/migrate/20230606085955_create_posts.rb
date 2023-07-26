class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.integer :prefecture_id, null: false
      t.string :park, null: false
      t.string :sento, null: false
      t.text :park_caption, null: false
      t.text :sento_caption, null: false

      t.timestamps
    end
  end
end
