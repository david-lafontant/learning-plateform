require 'rails_helper'

RSpec.describe CourseTraining, type: :model do
  subject do
    described_class.new(training_id: 2,
                        course_id: 2)
  end
  it 'is invalid if training_id is nil' do
    subject.training_id = nil
    expect(subject).to_not be_valid
  end
  it 'is invalid if training_id is less than 1' do
    subject.training_id = 0
    expect(subject).to_not be_valid
  end

  it 'is invalid if course_id is not a number' do
    subject.course_id = 3.to_s
    expect(subject).to_not be_valid
  end

  it 'is invalid if course_id is nil' do
    subject.course_id = nil
    expect(subject).to_not be_valid
  end
  it 'is invalid if course_id is less than 1' do
    subject.course_id = 0
    expect(subject).to_not be_valid
  end

  it 'is invalid if course_id is not a number' do
    subject.course_id = 1.to_s
    expect(subject).to_not be_valid
  end
end
