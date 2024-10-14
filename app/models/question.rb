class Question < ApplicationRecord
  belongs_to :survey
  has_many :options, dependent: :destroy
  has_many :responses, dependent: :destroy

  validates :survey, presence: true
  validates :text, presence: true, length: { minimum: 6 }
  validates :question_type, presence: true, inclusion: { in: %w[short_text long_text multiple_choice checkbox], message: "%{value} is not a valid question type" }
  # validate :validate_options_for_multiple_choice_and_checkbox
  
  # def validate_options_for_multiple_choice_and_checkbox
  #   if (question_type == 'multiple_choice' or question_type == 'checkbox') and (options.size < 0 or options.size > 5)
  #       errors.add(:options, 'Multiple choice and checkbox questions must have between 1 and 5 options')
  #   end
  # end
end