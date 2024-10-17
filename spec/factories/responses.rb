FactoryBot.define do
  factory :response do
    association :user 
    association :question 
    selected_option { association :option }
    text_response { "textResponse" }
  end
end
