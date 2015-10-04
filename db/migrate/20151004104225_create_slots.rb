class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.string :label
      t.datetime :start_time
      t.datetime :end_time
      t.integer :day

      t.belongs_to :teacher
      t.belongs_to :room
      t.belongs_to :schedule

      t.timestamps null: false
    end
  end
end
