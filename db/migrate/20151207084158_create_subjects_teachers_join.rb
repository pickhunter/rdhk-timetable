class CreateSubjectsTeachersJoin < ActiveRecord::Migration
  def change
    create_table :subjects_teachers, :id => false do |t|
    	t.integer "subject_id"
    	t.integer "page_id"
    end
  end
end
