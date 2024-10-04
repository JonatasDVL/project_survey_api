# frozen_string_literal: true

module Mutations
  class CreateSurvey < BaseMutation
    argument :title, String, required: true

    field :survey, Types::SurveyType, null: false

    def resolve(title:)
      survey = Survey.create!(title: title)
      { survey: survey }
    end
  end
end
