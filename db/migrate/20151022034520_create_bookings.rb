class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :name

      t.belongs_to :teacher
      t.belongs_to :room

      t.timestamps null: false
    end
  end
end
