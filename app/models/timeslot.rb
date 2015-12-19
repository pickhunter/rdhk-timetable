class Timeslot < ActiveRecord::Base
	enum day: [ :monday, :tuesday, :wednesday, :thursday, :friday, :saturday ]
	has_many :slots
end
