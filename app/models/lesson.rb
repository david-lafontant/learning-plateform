class Lesson < ApplicationRecord
  belongs_to :course_module
  has_many_attached :materials

  validates :title, presence: true, length: { in: 8..40 }
  validates :content, presence: true, length: { in: 30..300 }
  validates :course_module_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

end
