class User < ApplicationRecord
  has_secure_password
  has_many :surveys, dependent: :destroy
  has_many :responses, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }
  validates :role, presence: true, inclusion: { in: [0, 1], message: "%{value} is not a valid value
" }
  # enum role: { coordinator: 0, respondent: 1 }
end
