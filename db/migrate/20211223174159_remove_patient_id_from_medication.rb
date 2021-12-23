class RemovePatientIdFromMedication < ActiveRecord::Migration[6.1]
  def change
    remove_column :medications, :patient_id
  end
end
