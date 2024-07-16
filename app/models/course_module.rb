class CourseModule < ApplicationRecord
  belongs_to :course
  has_many :lessons, dependent: :destroy, inverse_of: :course_module

  validates :title, presence: true, length: { in: 8..40 }, uniqueness: { case_sensitive: false }
  validates :description, presence: true, length: { in: 30..300 }
  validates :course_id, presence: true, numericality: { only_integer: true, greater_than: 0 }

end
