# frozen_string_literal: true

module Types
  class ResponseType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :question_id, Integer, null: false
    field :selected_option_id, Integer
    field :text_response, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :user, Types::UserType, null: false
    field :question, Types::QuestionType, null: false
    field :selected_option, Types::OptionType, null: true
  end
end