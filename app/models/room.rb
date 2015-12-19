class Room < ActiveRecord::Base
	has_many :timeslots , :through => :slots
  validates :code, uniqueness: true
  validates :code, presence: true
  validates :name, presence: true
end
