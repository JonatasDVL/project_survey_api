FactoryBot.define do
  factory :option do
    text { "text" }
    association :question
  end
end
