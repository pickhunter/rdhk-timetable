class CreateTimeslots < ActiveRecord::Migration
  def change
    create_table :timeslots do |t|
    	t.column :day, :integer
    	t.time :starttime
    	t.time :endtime
      t.timestamps null: false
    end
  end
end
