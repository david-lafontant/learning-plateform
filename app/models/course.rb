class Course < ApplicationRecord
  belongs_to :teacher, class_name: 'User'
  has_many :course_trainings
  has_many :trainings, through: course_trainings
  validates :name, :description, :credit, :code, presence: true
  validates :name, length: {in: 8..40}, uniqueness: true
  validates :code, length: {in: 6..8}, uniqueness: true
  validates :description, length: {in: 30..300}
  validates :credit, numericality: { only_integer: true , greater_than_or_equal_to: 0 }
end
