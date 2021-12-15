class AddPatienIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :comments, :user
  end
end
