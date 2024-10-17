class Response < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :selected_option, class_name: 'Option', optional: true

  validates :user, presence: true
  validates :question, presence: true
  validate :validate_response_type

  def validate_response_type
    return if question.nil?
    
    case question.question_type
    when 'multiple_choice', 'checkbox'
      if selected_option.blank?
        errors.add(:selected_option, "must be provided for multiple choice or checkbox questions")
      end
    when 'short_text', 'long_text'
      if text_response.blank?
        errors.add(:text_response, "must be provided for text-based questions")
      elsif question.question_type == "short_text" and text_response.length > 255
        errors.add(:text_response, "should not be longer than 255 characters for short text")
      end
    end
  end

end
