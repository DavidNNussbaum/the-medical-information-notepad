class CreateSubjectives < ActiveRecord::Migration[6.1]
  def change
    create_table :subjectives do |t|
      t.text :description
      t.integer :scale
      t.string :location
      t.string :observed_changes
      t.datetime :start_date
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
