require 'rails_helper'

RSpec.describe EnrollementTraining, type: :model do
  subject do
    described_class.new(training_id: 2,
                        student_id: 2)
  end
  it 'is invalid if training_id is nil' do
    subject.training_id = nil
    expect(subject).to_not be_valid
  end
  it 'is invalid if training_id is less than 1' do
    subject.training_id = 0
    expect(subject).to_not be_valid
  end

  it 'is invalid if student_id is not a number' do
    subject.student_id = 3.to_s
    expect(subject).to_not be_valid
  end

  it 'is invalid if student_id is nil' do
    subject.student_id = nil
    expect(subject).to_not be_valid
  end
  it 'is invalid if student_id is less than 1' do
    subject.student_id = 0
    expect(subject).to_not be_valid
  end

  it 'is invalid if student_id is not a number' do
    subject.student_id = 1.to_s
    expect(subject).to_not be_valid
  end

  it 'is invalid if student_id is duplicated' do
    EnrollementTraining.create(training_id: 2, student_id: 2)
    enrollement2 = EnrollementTraining.create(training_id: 3, student_id: 2)
    enrollement3 = EnrollementTraining.create(training_id: 2, student_id: 2)

    expect(enrollement2).to_not be_valid
    expect(enrollement3).to_not be_valid
  end
end
