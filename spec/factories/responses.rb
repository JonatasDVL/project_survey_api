FactoryBot.define do
  factory :response do
    user { nil }
    question { nil }
    selected_option { nil }
    text_response { "MyText" }
  end
end
