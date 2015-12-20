class RenameRoomsTypeColumn < ActiveRecord::Migration
  def change
  	rename_column :rooms, :code, :room_type
  end
end
