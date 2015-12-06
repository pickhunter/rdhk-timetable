class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :subjects, :type, :sub_type
  end
end
