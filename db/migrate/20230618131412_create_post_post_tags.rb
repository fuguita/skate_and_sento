class CreatePostPostTags < ActiveRecord::Migration[6.1]
  def change
    create_table :post_post_tags do |t|
      
      t.references :post, foreign_key: true, null: false
      t.references :post_tag, foreign_key: true, null: false

      t.timestamps
    end
  end
end
