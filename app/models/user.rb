class User < ApplicationRecord
  has_secure_password
  has_many :surveys, dependent: :destroy
  has_many :responses, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\.[^@\s]+\z/, message: "is invalid" }
  validates :password, presence: true, length: { minimum: 6 }
  validates :role, presence: true, inclusion: { in: [0, 1] }
  # enum role: { coordinator: 0, respondent: 1 }
end
