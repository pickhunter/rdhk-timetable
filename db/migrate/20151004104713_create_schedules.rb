class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :name

      t.belongs_to :batch
      t.belongs_to :time_table

      t.timestamps null: false
    end
  end
end
