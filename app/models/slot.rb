class Slot < ActiveRecord::Base
  has_many :bookings

  belongs_to :time_table

  validates :label, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :day, presence: true
end
