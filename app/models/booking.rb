class Booking < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :room
  has_many :batches

  valifates :name, presence: true
end
