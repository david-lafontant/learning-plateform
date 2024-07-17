class CourseEnrollement < ApplicationRecord
  belongs_to :student, class_name: 'User'
  belongs_to :course

  validates :student_id, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :course_id, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
