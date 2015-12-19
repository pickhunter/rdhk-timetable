class Slot < ActiveRecord::Base

  belongs_to :timeslot
  belongs_to :batch
  belongs_to :teacher
  belongs_to :room
  belongs_to :subject

  validates :label, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :day, presence: true
end
