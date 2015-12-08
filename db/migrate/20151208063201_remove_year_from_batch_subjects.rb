class RemoveYearFromBatchSubjects < ActiveRecord::Migration
  def change
  	remove_column :batch_subjects, :year
  end
end
