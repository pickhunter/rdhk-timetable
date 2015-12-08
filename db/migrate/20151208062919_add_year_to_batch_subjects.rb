class AddYearToBatchSubjects < ActiveRecord::Migration
  def change
  	add_column :batch_subjects, :year, :integer	
  end
end
