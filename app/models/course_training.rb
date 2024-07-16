class CourseTraining < ApplicationRecord
  belongs_to :course
  belongs_to :training

  validates :training_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :course_id, presence: true, numericality: { only_integer: true, greater_than: 0 }

  before_create :update_training_credit
  # Method for updating the related training record

  private

  def update_training_credit
    training.credit += course.credit
    training.save
  end
end
