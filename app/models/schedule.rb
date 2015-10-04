class Schedule < ActiveRecord::Base
  belongs_to :batch
  belongs_to :timetable
end
