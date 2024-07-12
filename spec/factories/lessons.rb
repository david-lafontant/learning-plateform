FactoryBot.define do
  factory :lesson do
    title { "MyString" }
    content { "MyText" }
    materials { nil }
    course_module { nil }
  end
end
