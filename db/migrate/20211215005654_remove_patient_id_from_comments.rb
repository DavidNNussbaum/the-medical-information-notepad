class RemovePatientIdFromComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :patient_id
  end
end
