class User < ApplicationRecord
  has_many :surveys
  has_many :responses

  validates :name, presence: true, length: { minimum: 3 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }
  validates :role, presence: true, inclusion: { in: [0, 1], message: "%{value} não é um valor válido" }
  # enum role: { coordinator: 0, respondent: 1 }
end
