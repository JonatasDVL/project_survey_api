FactoryBot.define do
  factory :question do
    text { "MyString" }
    question_type { "MyString" }
    survey { nil }
  end
end
