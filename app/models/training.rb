class Training < ApplicationRecord
  has_many :course_trainings, dependent: :destroy, inverse_of: :training
  has_many :courses, through: :course_trainings
  has_many :enrollement_trainings, dependent: :destroy, inverse_of: :training
  has_many :users, through: :enrollement_trainings
  validates :name, :description, :credit, presence: true
  validates :name, length: { in: 8..40 }, uniqueness: true
  validates :description, length: { in: 30..300 }
  validates :credit, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
