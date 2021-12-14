class ChangePatientsToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_table :patients, :users
  end
end
