class TimeTable < ActiveRecord::Base
  has_many :schedules

  validates :name, presence: true
end
