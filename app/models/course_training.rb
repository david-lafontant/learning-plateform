class CourseTraining < ApplicationRecord
  belongs_to :course
  belongs_to :training
  before_create :update_training_credit


  #Method for updating the event
  private
  def update_training_credit
    self.training.credit += self.course.credit
    self.training.save
  end
end
