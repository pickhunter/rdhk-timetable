class CreateTimeTables < ActiveRecord::Migration
  def change
    create_table :time_tables do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
