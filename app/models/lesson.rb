class Lesson < ApplicationRecord
  belongs_to :course_module
  has_many_attached :materials
end
