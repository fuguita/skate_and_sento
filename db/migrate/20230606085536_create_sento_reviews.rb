class CreateSentoReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :sento_reviews do |t|
      
      t.integer :sento_id, null: false
      t.integer :user_id, null: false
      t.text :comment, null: false

      t.timestamps
    end
  end
end
