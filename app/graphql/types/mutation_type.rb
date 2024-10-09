# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject

    # field :create_user, mutation: Mutations::Users::CreateUser

    field :create_survey, mutation: Mutations::Surveys::CreateSurvey
    field :update_survey, mutation: Mutations::Surveys::UpdateSurvey
    field :delete_survey, mutation: Mutations::Surveys::DeleteSurvey
    
    field :create_question, mutation: Mutations::Questions::CreateQuestion
    field :update_question, mutation: Mutations::Questions::UpdateQuestion
    field :delete_question, mutation: Mutations::Questions::DeleteQuestion

    field :create_option, mutation: Mutations::Options::CreateOption
    field :update_option, mutation: Mutations::Options::UpdateOption
    field :delete_option, mutation: Mutations::Options::DeleteOption

    # field :create_response, mutation: Mutations::Response::CreateResponse
  end
end
