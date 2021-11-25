class CreateSurgeries < ActiveRecord::Migration[6.1]
  def change
    create_table :surgeries do |t|
      t.string :name, null: false
      t.datetime :date, null: false
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
