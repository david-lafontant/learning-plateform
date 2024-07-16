require 'rails_helper'

RSpec.describe CourseModule, type: :model do

  subject do
    described_class.new(title: 'abracadabra',
    description: 'dctjhkydytcyghkjluydtcxgjnfrzx$gb_njm.lkjhgchnjmjnhbyfWSRFRDfg', 
    course_id: 2)
  end

  it 'is invalid if the length of the title is less than 8 characters' do
    subject.title = 'zoe1234'
    expect(subject).to_not be_valid
  end
  it 'is invalid if the length of the title is more than 40 characters' do
    subject.title = 'dctjhkydytcyghkjluydtcxgjnfrzx$gb_njm.lkjhgchnjmjnhbyfWSRFRDfghnjgfcv123456788765rfghygtffrv'
    expect(subject).to_not be_valid
  end

  it 'is invalid if the length of the description is less than 30 characters' do
    subject.description = 'zoe1234'
    expect(subject).to_not be_valid
  end
  it 'is invalid if the length of the description is more than 300 characters' do
    subject.description = %q(
      dctjhkydytcyghkjluydtcxgjnfrzx\gb_njm.lkjhgchnjmjnhbyfWSRFRDfghnjgfcv123456788765rfghygtffrv
      dctjhkydytcyghkjluydtcxgjnfrzx\gb_njm.lkjhgchnjmjnhbyfWSRFRDfghnjgfcv123456788765rfghygtffrv
      dctjhkydytcyghkjluydtcxgjnfrzx\gb_njm.lkjhgchnjmjnhbyfWSRFRDfghnjgfcv123456788765rfghygtffrv
      dctjhkydytcyghkjluydtcxgjnfrzx\gb_njm.lkjhgchnjmjnhbyfWSRFRDfghnjgfcv123456788765rfghygtffrv
      )
    expect(subject).to_not be_valid
  end
  it 'is invalid course_id is nil' do
    subject.course_id = nil
    expect(subject).to_not be_valid
  end
  it 'is invalid course_id is less than 0' do
    subject.course_id = -1
    expect(subject).to_not be_valid
  end
  it 'is invalid course_id is equal to 0' do
    subject.course_id = -0
    expect(subject).to_not be_valid
  end
  it 'is invalid if the title is not unique' do
    course_module_1 = CourseModule.create(title: 'abracadabra',
                                description: 'dctjhkydytcyghkjluydtcxglnfrzx_njm.lkjhgchnjmjnhbyfWSRFRDfg', course_id: 3)
    course_module_2 = CourseModule.create(title: 'abracadabra',
                                description: 'dctjhkydytcyghkjluydtcxglnfrzx$gb_njm.lkjnjmjnhbyfWSRFRDfg', course_id: 4)
    expect(course_module_2).to_not be_valid
  end




end
