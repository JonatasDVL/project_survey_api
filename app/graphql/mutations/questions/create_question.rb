# frozen_string_literal: true

module Mutations
  class Questions::CreateQuestion < BaseMutation
    argument :survey_id, String, required: true
    argument :text, String, required: true
    argument :question_type, String, required: true

    field :question, Types::QuestionType, null: true
    field :errors, [String], null: false
    
    def resolve(**attributes)
      user = context[:current_user] 
      survey = Survey.find_by(id: attributes[:survey_id])

      if survey.nil?
        return { question: nil, errors: ["Survey not found"] }
      end

      user_confirmation = User.find_by(id: survey.user_id)
      
      if user.role == 1 or user != user_confirmation 
        return { question: nil, errors: ["Permission denied for create"] }
      end

      question = Question.new(
        survey_id: attributes[:survey_id], 
        text: attributes[:text], 
        question_type: attributes[:question_type], 
      )
      if question.save 
        { question: question, errors: []}
      else
        { question: question, errors: question.errors.full_messages}
      end
    end
  end
end
