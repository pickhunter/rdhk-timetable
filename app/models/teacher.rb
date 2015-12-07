class Teacher < ActiveRecord::Base
  belongs_to :department
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :batches

  validates :code, uniqueness: true
  validates :code, presence: true
  validates :name, presence: true
  validates :department, presence: true
end
