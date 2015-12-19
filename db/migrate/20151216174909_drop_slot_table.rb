class DropSlotTable < ActiveRecord::Migration
  def change
  	drop_table :slots
  end
end
