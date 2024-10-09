# frozen_string_literal: true

module Mutations
  class Questions::DeleteQuestion < BaseMutation
    argument :id, String, required: true

    field :question, Types::QuestionType, null: true
    field :errors, [String], null: false

    def resolve(**attributes)
      user = context[:current_user] 
      question = Question.find_by(id: attributes[:id])
      
      if question.nil?
        return { question: nil, errors: ["Question not found"] }
      end
      
      survey = Survey.find_by(id: question.survey_id)
      
      user_confirmation = User.find_by(id: survey.user_id)
      
      if user.role == 1 or user != user_confirmation 
        return { question: nil, errors: ["Permission denied for delete"] }
      end

      if question.destroy
        { question: question, errors: []}
      else
        { question: question, errors: question.errors.full_messages}
      end
    end
  end
end