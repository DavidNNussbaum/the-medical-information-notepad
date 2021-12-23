class RemovePatientIdFromSubjective < ActiveRecord::Migration[6.1]
  def change
    remove_column :subjectives, :patient_id
  end
end
