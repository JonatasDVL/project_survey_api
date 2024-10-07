# frozen_string_literal: true

module Mutations
  class Surveys::CreateSurvey < BaseMutation
    argument :title, String, required: true
    argument :start_date, GraphQL::Types::ISO8601DateTime, required: true
    argument :end_date, GraphQL::Types::ISO8601DateTime, required: true

    field :survey, Types::SurveyType, null: true
    field :errors, [String], null: false

    def resolve(**attributes)
      user = context[:current_user] 
      if user.role == 0
        survey = Survey.new(
          title: attributes[:title], 
          start_date: attributes[:start_date], 
          end_date: attributes[:end_date], 
          user: user
        )
        if survey.save 
          { survey: survey, errors: []}
        else
          { survey: survey, errors: survey.errors.full_messages}
        end
      else
        { survey: nil, errors: ["Permission denied for creation"] }
      end
    end
  end
end
