class RemovePatientIdFromImmunization < ActiveRecord::Migration[6.1]
  def change
    remove_column :immunizations, :patient_id
  end
end
