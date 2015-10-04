class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :code

      t.belongs_to :department

      t.timestamps null: false
    end
  end
end
