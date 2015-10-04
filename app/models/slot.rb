class Slot < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :room
  belongs_to :schedule
end
