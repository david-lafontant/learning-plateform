require 'rails_helper'

RSpec.describe Course, type: :model do
  subject do
    described_class.new(name: 'abracadabra', code: 'AMX4565',
                        description: 'dctjhkydytcyghkjluydtcxgjnfrzx$gb_njm.lkjhgchn', credit: 10, teacher_id: 1)
  end

  it 'is invalid if the length of the name is less than 8 characters' do
    subject.name = 'zoe1234'
    expect(subject).to_not be_valid
  end
  it 'is invalid if the length of the name is more than 40 characters' do
    subject.name = 'dctjhkydytcyghkjluydtcxgjnfrzx$gb_njm.lkjhgchnjmjnhhnjgfcv123456'
    expect(subject).to_not be_valid
  end

  it 'is invalid if the length of the CODE is less than 6 characters' do
    subject.code = 'zoe12'
    expect(subject).to_not be_valid
  end
  it 'is invalid if the length of the CODE is more than 8 characters' do
    subject.code = 'dctjhkhygtffrv'
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
  it 'is invalid if the number of credit is nil' do
    subject.credit = nil
    expect(subject).to_not be_valid
  end
  it 'is invalid if the number of credit is negative' do
    subject.credit = -1
    expect(subject).to_not be_valid
  end
  it 'is invalid if the course name is not unique' do
    user = User.create(email: 'info@example.com', password: 'Password2345')
    course1 = Course.create(name: 'abracadabra', code: 'AMX4565',
                            description: 'dctjhkydytcyghkjluydtcxglnfrzx$gb_njm.lkjh', credit: 10, teacher_id: user.id)
    course2 = Course.create(name: 'abracadabra', code: 'AMX4566',
                            description: 'dctjhkydytcyghkjluydtcxgjnfrzx$gb_njm.lkjh', credit: 19, teacher_id: user.id)
    expect(course1).to be_valid
    expect(course2).to_not be_valid
  end

  it 'is invalid if the course code is not unique' do
    user = User.create(email: 'info@example.com', password: 'Password2345')
    course1 = Course.create(name: 'abracadabra', code: 'ABSC345',
                            description: 'dctjhkydytcyghkjluydtcxglnfrzx$gb_njm.l', credit: 10, teacher_id: user.id)
    course2 = Course.create(name: 'abrocadabrac', code: 'ABSC345',
                            description: 'dctjhkydytcyghkjluydtcxglnfrzx$gb_njm.l', credit: 19, teacher_id: user.id)
    expect(course1).to be_valid
    expect(course2).to_not be_valid
  end
end
