class CreateParkParkTags < ActiveRecord::Migration[6.1]
  def change
    create_table :park_park_tags do |t|
      t.references :park, foreign_key: true, null: false
      t.references :park_tag, foreign_key: true, null: false

      t.timestamps
    end
  end
end
