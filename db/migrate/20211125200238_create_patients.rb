class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.string :username, null: false
      t.string :password_digest, null: false
      t.json :diagnoses, null: false
      t.string :allergies, null: false
      t.string :current_treatments, null: false

      t.timestamps
    end
  end
end
