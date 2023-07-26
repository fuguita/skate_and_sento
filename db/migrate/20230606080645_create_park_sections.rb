class CreateParkSections < ActiveRecord::Migration[6.1]
  def change
    create_table :park_sections do |t|
      t.integer :park_id, null: false
      t.integer :section_id, null: false

      t.timestamps
    end
  end
end
