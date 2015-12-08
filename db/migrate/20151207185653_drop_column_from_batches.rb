class DropColumnFromBatches < ActiveRecord::Migration
  def change
  	remove_column :batches, :start_time
  	remove_column :batches, :end_time
  end
end
