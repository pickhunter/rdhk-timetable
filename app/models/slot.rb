class Slot < ActiveRecord::Base

  belongs_to :timeslot
  belongs_to :batch
  belongs_to :teacher
  belongs_to :room
  belongs_to :subject

end
