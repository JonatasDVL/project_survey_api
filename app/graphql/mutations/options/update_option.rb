# frozen_string_literal: true

module Mutations
  class Options::UpdateOption < BaseMutation
    argument :id, String, required: true
    argument :text, String, required: true
    
    field :option, Types::OptionType, null: true
    field :errors, [String], null: false

    def resolve(**attributes)
      user = context[:current_user] 
      option = Option.find_by(id: attributes[:id])
      
      if option.nil?
        return { option: nil, errors: ["Option not found"] }
      end
      
      question = Question.find_by(id: option.question_id)

      survey = Survey.find_by(id: question.survey_id)

      user_confirmation = User.find_by(id: survey.user_id)
      
      if user.role == 1 or user != user_confirmation 
        return { option: nil, errors: ["Permission denied for update"] }
      end

      option.text = attributes[:text] unless attributes[:text].nil?

      if option.save 
        { option: option, errors: []}
      else
        { option: option, errors: option.errors.full_messages}
      end
    end
  end
end