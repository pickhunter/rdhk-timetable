class CreateSlotsAgain < ActiveRecord::Migration
  def change
        create_table :slots do |t|
    	t.references :timeslot
    	t.references :batch
    	t.references :subject
    	t.references :teacher
    	t.references :room
      t.timestamps null: false
 
    end
  end
end
