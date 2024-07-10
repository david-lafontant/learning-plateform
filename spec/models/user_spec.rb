require 'rails_helper'

RSpec.describe User, type: :model do

  subject{
    described_class.new(email: "info@example.com", password: "Password2345")
  }

  it 'is invalid if the paswword length is less than 8 characters' do
   subject.password = "zoe1234"
   expect(subject).to_not be_valid
  end
  it 'is invalid if the password length is more than 40 characters' do
    subject.password = "dctjhkydytcyghkjluydtcxgjnkjmhgtfrzx$gb_njm.lkjhgchnjmjnhbyfWSRFRDfghnjgfcv123456788765rfghygtffrv"
    expect(subject).to_not be_valid
  end
end
