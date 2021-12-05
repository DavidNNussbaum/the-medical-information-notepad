class AddDiagnosisFamilyHistory < ActiveRecord::Migration[6.1]
  def change
    add_column :family_histories, :diagnosis, :json, null: false 
  end
end
