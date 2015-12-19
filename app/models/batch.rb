class Batch < ActiveRecord::Base
  has_many :batch_subjects
  has_many :subjects , :through => :batch_subjects
  has_many :slots
  has_many :timeslots , :through => :slots
  validates :name, presence: true
end
