FactoryBot.define do
  factory :survey do
    title { "title" }
    start_date { "2024-10-03 19:53:16" }
    end_date { "2024-10-04 19:53:16" }
    association :user 
  end
end
