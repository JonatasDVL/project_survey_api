class Option < ApplicationRecord
  belongs_to :question
  has_many :responses, foreign_key: 'selected_option_id', dependent: :destroy

  validates :text, presence: true
  validates :question, presence: true
  validate :validate_options_for_multiple_choice_and_checkbox, if: :new_record?
  
  def validate_options_for_multiple_choice_and_checkbox
    question = Question.find_by(id: question_id)
    return if question.nil?
    options = Option.where(question_id: self.question_id) 
    if (question.question_type == 'multiple_choice' or question.question_type == 'checkbox') and (options.size > 4)
        errors.add(:options, 'Multiple choice and checkbox questions must have between 1 and 5 options')
    end
  end
end
