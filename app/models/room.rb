class Room < ActiveRecord::Base
	has_many :timeslots , :through => :slots
  has_many :slots
  validates :code, uniqueness: true
  validates :code, presence: true
  validates :name, presence: true
end
