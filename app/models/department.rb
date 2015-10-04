class Department < ActiveRecord::Base
  validates :code, uniqueness: true
  validates :code, presence: true
  validates :name, presence: true
end
