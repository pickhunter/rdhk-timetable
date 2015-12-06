class Teacher < ActiveRecord::Base
  belongs_to :department
  has_and_belongs_to_many :subject
  has_and_belongs_to_many :batch

  validates :code, uniqueness: true
  validates :code, presence: true
  validates :name, presence: true
  validates :department, presence: true
end
