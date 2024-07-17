class EnrollementTraining < ApplicationRecord
  belongs_to :training
  belongs_to :student, class_name: 'User'

  validates :training_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :student_id, presence: true, numericality: { only_integer: true, greater_than: 0 }, uniqueness: true
end
