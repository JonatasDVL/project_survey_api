# frozen_string_literal: true

module Mutations
  class Options::CreateOption < BaseMutation
    argument :question_id, String, required: true
    argument :text, String, required: true

    field :option, Types::OptionType, null: true
    field :errors, [String], null: false
    
    def resolve(**attributes)
      user = context[:current_user] 
      question = Question.find_by(id: attributes[:question_id])

      if question.nil?
        return { option: nil, errors: ["Question not found"] }
      end

      survey = Survey.find_by(id: question.survey_id)

      user_confirmation = User.find_by(id: survey.user_id)
      
      if user.role == 1 or user != user_confirmation
        return { option: nil, errors: ["Permission denied for create"] }
      end

      option = Option.new(
        question_id: attributes[:question_id], 
        text: attributes[:text], 
      )
      if option.save 
        { option: option, errors: []}
      else
        { option: option, errors: option.errors.full_messages}
      end
    end
  end
end
