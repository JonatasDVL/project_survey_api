# frozen_string_literal: true

module Mutations
  class Surveys::DeleteSurvey < BaseMutation
    argument :id, String, required: true

    field :survey, Types::SurveyType, null: true
    field :errors, [String], null: false

    def resolve(**attributes)
      user = context[:current_user] 
      survey = Survey.find_by(id: attributes[:id])
      
      if survey.nil?
        return { survey: nil, errors: ["Survey not found"] }
      end

      user_confirmation = User.find_by(id: survey.user_id)
      
      if user.role == 1 or user != user_confirmation 
        return { survey: nil, errors: ["Permission denied for delete"] }
      end

      if survey.destroy
        { survey: survey, errors: []}
      else
        { survey: survey, errors: survey.errors.full_messages}
      end
    end
  end
end