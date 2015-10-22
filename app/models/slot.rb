class Slot < ActiveRecord::Base
  has_many :bookings

  validates :label, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :day, presence: true
end
