class Response < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :selected_option, class_name: 'Option', optional: true

  validates :user, presence: true
  validates :question, presence: true
  validates :selected_option, presence: true, if: -> { text_response.blank? }
  validates :text_response, presence: true, if: -> { selected_option.blank? }
  validate :only_one_response_type

  def only_one_response_type
    if selected_option.present? && text_response.present?
      errors.add(:base, "Apens uma resposta pode ser fornecida: ou uma opção ou uma resposta de texto.")
    end
  end

end
