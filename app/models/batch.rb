class Batch < ActiveRecord::Base
	has_and_belongs_to_many :teachers
	has_and_belongs_to_many :subjects
  validates :name, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
