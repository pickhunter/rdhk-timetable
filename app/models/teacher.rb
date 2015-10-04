class Teacher < ActiveRecord::Base
  belongs_to :department

  validates :code, uniqueness: true
  validates :code, presence: true
  validates :name, presence: true
  validates :department, presence: true
end
