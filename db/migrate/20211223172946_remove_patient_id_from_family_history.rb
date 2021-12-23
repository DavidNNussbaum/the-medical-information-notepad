class RemovePatientIdFromFamilyHistory < ActiveRecord::Migration[6.1]
  def change
    remove_column :family_histories, :patient_id
  end
end
