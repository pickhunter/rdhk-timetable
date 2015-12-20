class Room < ActiveRecord::Base
	has_many :timeslots , :through => :slots
  has_many :slots

  validates :name, presence: true
end
