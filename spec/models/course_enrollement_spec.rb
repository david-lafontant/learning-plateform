require 'rails_helper'

RSpec.describe CourseEnrollement, type: :model do
  subject do
    described_class.new(student_id: 2,
                        course_id: 2)
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
end
