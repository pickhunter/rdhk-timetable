class BatchSubject < ActiveRecord::Base
	belongs_to :batch
    belongs_to :subject
    belongs_to :teacher
end
