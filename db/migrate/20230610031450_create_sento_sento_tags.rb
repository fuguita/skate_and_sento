class CreateSentoSentoTags < ActiveRecord::Migration[6.1]
  def change
    create_table :sento_sento_tags do |t|
      t.integer :sento_id, null: false
      t.integer :sento_tag_id, null: false
      t.timestamps
    end
  end
end
