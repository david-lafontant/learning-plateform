class CourseTraining < ApplicationRecord
  belongs_to :course
  belongs_to :training
  before_create :update_training_credit

  # Method for updating the event
  private

  def update_training_credit
    training.credit += course.credit
    training.save
  end
end
