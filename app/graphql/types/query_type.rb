# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :surveys, [SurveyType], null: false

    field :survey, Types::ResponseType, null: false do
      argument :id, ID, required: true
    end

    def surveys
      Survey.all
    end

    def survey(id:)
      Survey.find(id)
    end

    field :questions, [Types::QuestionType], null: false, description: "Return a list of questions"

    field :question, Types::QuestionType, null: false do
      argument :id, ID, required: true
    end

    def questions
      Question.all
    end

    def question(id:)
      Question.find(id)
    end

    field :options, [Types::OptionType], null: false, description: "Return a list of options"

    field :option, Types::OptionType, null: false do
      argument :id, ID, required: true
    end

    def options
      Option.all
    end

    def response(id:)
      Option.find(id)
    end

    field :users, [Types::UserType], null: false, description: "Return a list of users"

    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    def users
      User.all
    end

    def user(id:)
      User.find(id)
    end

    field :responses, [Types::ResponseType], null: false, description: "Return a list of responses"

    field :response, Types::ResponseType, null: false do
      argument :id, ID, required: true
    end

    def responses
      Response.all
    end

    def response(id:)
      Response.find(id)
    end

  end
end
