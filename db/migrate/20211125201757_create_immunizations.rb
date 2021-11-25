class CreateImmunizations < ActiveRecord::Migration[6.1]
  def change
    create_table :immunizations do |t|
      t.json :name
      t.datetime :date
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
