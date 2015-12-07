class Subject < ActiveRecord::Base
	belongs_to :department
	has_and_belongs_to_many :teachers
	has_and_belongs_to_many :batches
end
