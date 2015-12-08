class CreateBatchSubjectTable < ActiveRecord::Migration
  def change
    create_table :batch_subject do |t|
    	t.references :batch
    	t.references :subject
    	t.references :teacher
    end
  end
end
