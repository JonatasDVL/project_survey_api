# frozen_string_literal: true

module Types
  class QuestionType < Types::BaseObject
    field :id, ID, null: false
    field :text, String
    field :question_type, String
    field :survey_id, Integer, null: false
    field :options, [Types::OptionType], null: false
    field :responses, [Types::ResponseType], null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end