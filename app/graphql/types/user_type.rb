# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :password, String, null: false
    field :role, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :surveys, [Types::SurveyType], null: true
    field :responses, [Types::ResponseType], null: true
  end
end
