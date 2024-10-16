# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    include Helpers::AuthAdmHelper

    field :surveys, [SurveyType], null: false, description: "Return a list of surveys"
    
    field :survey, Types::SurveyType, null: false do
      argument :id, ID, required: true
    end
    
    field :open_surveys, resolver: Resolvers::Surveys::OpenSurveys

    field :closed_surveys, resolver: Resolvers::Surveys::ClosedSurveys

    field :my_surveys, resolver: Resolvers::Surveys::MySurveys
    
    field :my_open_surveys, resolver: Resolvers::Surveys::MyOpenSurveys

    field :my_closed_surveys, resolver: Resolvers::Surveys::MyClosedSurveys

    field :question, Types::QuestionType, null: false do
      argument :id, ID, required: true
    end
    
    field :questions, [Types::QuestionType], null: false, description: "Return a list of questions"
    
    field :my_questions, resolver: Resolvers::Questions::MyQuestions

    field :options, [Types::OptionType], null: false, description: "Return a list of options"
    
    field :option, Types::OptionType, null: false do
      argument :id, ID, required: true
    end
    
    field :my_options, resolver: Resolvers::Options::MyOptions

    field :users, [Types::UserType], null: false, description: "Return a list of users"
    
    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    field :responses, [Types::ResponseType], null: false, description: "Return a list of responses"

    field :response, Types::ResponseType, null: false do
      argument :id, ID, required: true
    end

    field :my_responses, resolver: Resolvers::Responses::MyResponses

    field :response_counts_by_question, [Types::ResponseCountByQuestionType], resolver: Resolvers::Responses::ResponseCountsByQuestion, null: false

    field :response_counts_by_option, [Types::ResponseCountByOptionType], resolver: Resolvers::Responses::ResponseCountsByOption, null: false

    def surveys
      Survey.all
    end

    def survey(id:)
      Survey.find(id)
    end
    
    def questions
      Question.all
    end

    def question(id:)
      Question.find(id)
    end

    def options
      Option.all
    end

    def option(id:)
      Option.find(id)
    end

    def users
      authorize_admin!
      User.all
    end

    def user(id:)
      authorize_admin!
      User.find(id)
    end

    def responses
      Response.all
    end

    def response(id:)
      Response.find(id)
    end
  end
end
