class CreateMedications < ActiveRecord::Migration[6.1]
  def change
    create_table :medications do |t|
      t.string :name, null: false
      t.string :strength
      t.string :route 
      t.string :frequency
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
