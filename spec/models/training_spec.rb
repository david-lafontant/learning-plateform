require 'rails_helper'

RSpec.describe Training, type: :model do
  subject do
    described_class.new(name: 'abracadabra',
                        description: 'dctjhkydytcyghkjluydtcxgjnfrzx$gb_njm.lkjhgchnjmjnhbyfWSRFRDfg', credit: 10)
  end

  it 'is invalid if the length of the name is less than 8 characters' do
    subject.name = 'zoe1234'
    expect(subject).to_not be_valid
  end
  it 'is invalid if the length of the name is more than 40 characters' do
    subject.name = 'dctjhkydytcyghkjluydtcxgjnfrzx$gb_njm.lkjhgchnjmjnhbyfWSRFRDfghnjgfcv123456788765rfghygtffrv'
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
  it 'is invalid if the training name is not unique' do
    training1 = Training.create(name: 'abracadabra',
                                description: 'dctjhkydytcyghkjluydtcxglnfrzx_njm.lkjhgchnjmjnhbyfWSRFRDfg', credit: 10)
    training2 = Training.create(name: 'abracadabra',
                                description: 'dctjhkydytcyghkjluydtcxglnfrzx$gb_njm.lkjnjmjnhbyfWSRFRDfg', credit: 19)
    expect(training1).to be_valid
    expect(training2).to_not be_valid
  end
end
