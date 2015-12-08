class Batch < ActiveRecord::Base
has_many :batch_subjects
has_many :subjects , :through => :batch_subjects
  validates :name, presence: true
end
