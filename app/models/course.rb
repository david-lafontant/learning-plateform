class Course < ApplicationRecord
  belongs_to :teacher, class_name: 'User'
  has_many :course_trainings, dependent: :destroy
  has_many :trainings, through: :course_trainings
  has_many :course_enrollements, dependent: :destroy
  has_many :users, through: :course_enrollements, foreign_key: :student_id
  has_many :course_modules, dependent: :destroy
  
  validates :name, :description, :credit, :code, presence: true
  validates :name, length: {in: 8..40}, uniqueness: true
  validates :code, length: {in: 6..8}, uniqueness: true
  validates :description, length: {in: 30..300}
  validates :credit, numericality: { only_integer: true , greater_than_or_equal_to: 0 }

end
