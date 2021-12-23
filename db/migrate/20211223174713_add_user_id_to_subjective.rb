class AddUserIdToSubjective < ActiveRecord::Migration[6.1]
  def change
    add_reference :subjectives, :user
  end
end
