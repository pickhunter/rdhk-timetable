class Department < ActiveRecord::Base
  validates :code, uniqueness: true
  validates :code, presence: true
  validates :name, presence: true
  #my addition
  has_many :teachers
  has_many :subjects
end
