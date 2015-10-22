class TimeTable < ActiveRecord::Base
  validates :name, presence: true

  has_many :slots
end
