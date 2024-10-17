class Question < ApplicationRecord
  belongs_to :survey
  has_many :options, dependent: :destroy
  has_many :responses, dependent: :destroy

  validates :survey, presence: true
  validates :text, presence: true, length: { minimum: 6 }
  validates :question_type, presence: true, inclusion: { in: ["short_text", "long_text", "multiple_choice", "checkbox"] }

end