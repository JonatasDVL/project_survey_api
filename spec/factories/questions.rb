FactoryBot.define do
  factory :question do
    text { "textooo" }
    question_type { "short_text" }
    association :survey
  end
end
