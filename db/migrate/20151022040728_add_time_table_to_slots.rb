class AddTimeTableToSlots < ActiveRecord::Migration
  def change
    add_reference :slots, :time_table, index: true
  end
end
