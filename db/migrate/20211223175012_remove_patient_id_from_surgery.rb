class RemovePatientIdFromSurgery < ActiveRecord::Migration[6.1]
  def change
    remove_column :surgeries, :patient_id, :bigint
  end
end
