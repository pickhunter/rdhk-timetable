class Schedule < ActiveRecord::Base
  belongs_to :batch
  belongs_to :time_table

  validates :name, presence: true
end
