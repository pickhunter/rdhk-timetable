class AddDepartmentToSubjects < ActiveRecord::Migration
  def change
    add_reference :subjects, :department, index: true, foreign_key: true
  end
end
	