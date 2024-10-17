FactoryBot.define do
  factory :user do
    name { "nameUser" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "123456" }
    role { 1 }
  end
end
