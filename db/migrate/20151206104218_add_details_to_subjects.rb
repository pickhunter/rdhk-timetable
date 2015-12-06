class AddDetailsToSubjects < ActiveRecord::Migration
  def change
  	    add_column :subjects, :code, :string
  	    add_column :subjects, :type, :string
  	    add_column :subjects, :name, :string
  	    add_column :subjects, :semester, :integer
  	    add_foreign_key :subjects, :departments
    
  end
end
