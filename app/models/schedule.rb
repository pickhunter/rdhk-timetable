class Schedule < ActiveRecord::Base
  belongs_to :batch
  belongs_to :time_table
end
