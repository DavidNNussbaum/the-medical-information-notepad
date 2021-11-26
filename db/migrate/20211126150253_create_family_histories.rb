class CreateFamilyHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :family_histories do |t|
      t.json :diagnosis
      t.boolean :mother
      t.boolean :father
      t.boolean :sister
      t.boolean :brother
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
