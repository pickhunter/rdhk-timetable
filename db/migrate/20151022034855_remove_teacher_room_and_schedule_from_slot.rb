class RemoveTeacherRoomAndScheduleFromSlot < ActiveRecord::Migration
  def change
    remove_column :slots, :teacher_id, :string
    remove_column :slots, :room_id, :string
    remove_column :slots, :schedule_id, :string
  end
end
