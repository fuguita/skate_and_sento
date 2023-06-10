class CreateSentoSentoTags < ActiveRecord::Migration[6.1]
  def change
    create_table :sento_sento_tags do |t|
      t.references :sento, foreign_key: true, null: false
      t.references :sento_tag, foreign_key: true, null: false
      t.timestamps
    end
  end
end
