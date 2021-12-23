class AddUserIdToFamilyHistory < ActiveRecord::Migration[6.1]
  def change
    add_reference :family_histories, :user
  end
end
