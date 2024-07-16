require 'rails_helper'

RSpec.describe Lesson, type: :model do

  subject do
    described_class.new(
      title: "lesson 4",
      content: %q(
        dctjhkydytcyghkjluydtcxgjnfrzx\gb_njm.lkjhgchnjmjnhbyfWSRFRDfghnjgfcv123456788765rfghygtffrv
        dctjhkydytcyghkjluydtcxgjnfrzx\gb_njm.lkjhgchnjmjnhbyfWSRFRDfghnjgfcv123456788765rfghygtffrv
        ),
      course_module_id: 2
    )
  end

  it 'is invalid if the length of the title is less than 8 characters' do
    subject.title = 'zofgtry'
    expect(subject).to_not be_valid
  end
  it 'is invalid if the length of the title is more than 40 characters' do
    subject.title = 'dctjhkydytcyghkjluydtcxgjnfrzx$gb_njm.lkjhgchnjmjnhbyfWSRFRDfghnjgfcv123456788765rfghygtffrv'
    expect(subject).to_not be_valid
  end
  it 'is invalid if the length of the content is less than 30 characters' do
    subject.content = 'zoe1234'
    expect(subject).to_not be_valid
  end
  it 'is invalid if the length of the content is more than 300 characters' do
    subject.content = %q(
      dctjhkydytcyghkjluydtcxgjnfrzx\gb_njm.lkjhgchnjmjnhbyfWSRFRDfghnjgfcv123456788765rfghygtffrv
      dctjhkydytcyghkjluydtcxgjnfrzx\gb_njm.lkjhgchnjmjnhbyfWSRFRDfghnjgfcv123456788765rfghygtffrv
      dctjhkydytcyghkjluydtcxgjnfrzx\gb_njm.lkjhgchnjmjnhbyfWSRFRDfghnjgfcv123456788765rfghygtffrv
      dctjhkydytcyghkjluydtcxgjnfrzx\gb_njm.lkjhgchnjmjnhbyfWSRFRDfghnjgfcv123456788765rfghygtffrv
      )
    expect(subject).to_not be_valid
  end
  it 'is invalid if course_module_id is nil' do
    subject.course_module_id = nil
    expect(subject).to_not be_valid
  end
  it 'is invalid if course_module_id is less than 1' do
    subject.course_module_id = 0
    expect(subject).to_not be_valid
  end

  it 'is invalid if course_module_id is not an integer' do
    subject.course_module_id = 0
    expect(subject).to_not be_valid
  end




end
