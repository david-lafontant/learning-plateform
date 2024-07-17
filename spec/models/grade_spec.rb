require 'rails_helper'

RSpec.describe Grade, type: :model do
  subject do
    described_class.new(student_id: 3, course_id: 3, grade: 75)
  end

  it 'is invalid if student_id is nil' do
    subject.student_id = nil
    expect(subject).to_not be_valid
  end
  it 'is invalid if student_id is negative' do
    subject.student_id = -1
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
  it 'is invalid if course_id is negative' do
    subject.course_id = -1
    expect(subject).to_not be_valid
  end

  it 'is invalid if course_id is not a number' do
    subject.course_id = 1.to_s
    expect(subject).to_not be_valid
  end

  it 'is invalid if grade is nil' do
    subject.grade = nil
    expect(subject).to_not be_valid
  end
  it 'is invalid if grade is negative' do
    subject.grade = -1
    expect(subject).to_not be_valid
  end

  it 'is invalid if grade is greater than 100' do
    grade1 = Grade.create(student_id: 3, course_id: 3, grade: 175)
    expect(grade1).to_not be_valid
  end

  it 'is invalid if grade is not a number' do
    subject.grade = 28.to_s
    expect(subject).to_not be_valid
  end
end
