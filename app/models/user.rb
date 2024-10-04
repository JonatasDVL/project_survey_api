class User < ApplicationRecord
  has_many :surveys
  has_many :responses

  enum role: { coordinator: 0, respondent: 1 }
end
