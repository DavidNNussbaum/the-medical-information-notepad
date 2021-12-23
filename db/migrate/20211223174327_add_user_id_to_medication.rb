class AddUserIdToMedication < ActiveRecord::Migration[6.1]
  def change
    add_reference :medications, :user
  end
end
