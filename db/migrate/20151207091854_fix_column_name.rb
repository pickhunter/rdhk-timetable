class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :subjects_teachers, :page_id, :teacher_id
  end
end
