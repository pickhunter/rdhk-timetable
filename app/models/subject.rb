class Subject < ActiveRecord::Base
	belongs_to :department
	has_and_belongs_to_many :teachers
	has_many :batch_subjects
	has_many :batches , :through => :batch_subjects
	has_many :slots #because a sunject maybe taught simultaneously in many lectures at same time
end
