class CreateParkReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :park_reviews do |t|
      t.integer :park_id, null: false
      t.integer :user_id, null: false
      t.text :comment, null: false

      t.timestamps
    end
  end
end
