class CreateBatchSubjects < ActiveRecord::Migration
  def change
    create_table :batch_subjects do |t|
    	t.references :batch
    	t.references :subject
    	t.references :teacher

      t.timestamps 
    end
  end
end
