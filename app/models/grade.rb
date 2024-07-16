class Grade < ApplicationRecord
  belongs_to :student, class_name: 'User'
  belongs_to :course
  validates :course_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :student_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :grade, presence: true, numericality: { only_number: true, greater_than: 0 , less_than: 100.0 }
end
