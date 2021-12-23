class AddUserIdToSurgery < ActiveRecord::Migration[6.1]
  def change
    add_reference :surgeries, :user
  end
end
