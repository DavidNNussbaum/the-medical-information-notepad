class RemoveDiagnosisFamilyHistory < ActiveRecord::Migration[6.1]
  def change
    remove_column :family_histories, :diagnosis, :json 
  end
end
