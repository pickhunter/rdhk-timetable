class Batch < ActiveRecord::Base
  validates :name, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
