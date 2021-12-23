class AddUserIdToImmunization < ActiveRecord::Migration[6.1]
  def change
    add_reference :immunizations, :user
  end
end
