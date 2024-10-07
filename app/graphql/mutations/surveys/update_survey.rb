# frozen_string_literal: true

module Mutations
  class Surveys::UpdateSurvey < BaseMutation
    argument :id, String, required: true
    argument :title, String, required: false
    argument :start_date, GraphQL::Types::ISO8601DateTime, required: false
    argument :end_date, GraphQL::Types::ISO8601DateTime, required: false

    field :survey, Types::SurveyType, null: true
    field :errors, [String], null: false

    def resolve(id:, **attributes)
      user = context[:current_user] 
      survey = Survey.find_by(id: id)
      
      if survey.nil?
        return { survey: nil, errors: ["Survey not found"] }
      end
      
      if user.role == 1 
        return { survey: nil, errors: ["Permission denied for update"] }
      end

      survey.title = attributes[:title] unless attributes[:title].nil?
      survey.start_date = attributes[:start_date] unless attributes[:start_date].nil?
      survey.end_date = attributes[:end_date] unless attributes[:end_date].nil?

      if survey.save 
        { survey: survey, errors: []}
      else
        { survey: survey, errors: survey.errors.full_messages}
      end
    end
  end
end