FactoryBot.define do
  factory :course do
    name { 'MyString' }
    code { 'MyString' }
    description { 'MyString' }
    credit { 'MyString' }
    user { nil }
  end
end
