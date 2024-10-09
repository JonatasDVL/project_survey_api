class Question < ApplicationRecord
  belongs_to :survey
  has_many :options, dependent: :destroy
  has_many :responses, dependent: :destroy

  validates :text, presence: true, length: { minimum: 6 }
  validates :question_type, presence: true, inclusion: { in: %w[text multiple_choice checkbox], message: "%{value} não é um tipo de pergunta válido" }
  validates :survey, presence: true
end
