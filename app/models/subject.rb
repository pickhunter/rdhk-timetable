class Subject < ActiveRecord::Base
	belongs_to :department
	has_and_belongs_to_many :teacher
end
