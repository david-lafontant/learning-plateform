class User < ApplicationRecord
  validates :password, presence: true, length: { in: 8..20 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :courses, foreign_key: :teacher_id
  has_many :course_enrollements, foreign_key: :student_id, dependent: :destroy
  has_many :courses, through: :course_enrollements
  has_many :grades, foreign_key: :student_id
end
