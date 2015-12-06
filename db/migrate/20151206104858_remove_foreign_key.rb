class RemoveForeignKey < ActiveRecord::Migration
  def change
  	remove_foreign_key :subjects, :departments
  end
end
