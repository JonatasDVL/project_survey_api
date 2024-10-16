module Resolvers
  module Surveys
    class MySurveys < Resolvers::BaseResolver

      type [Types::SurveyType], null: false

      def resolve
        Survey.where(user_id: context[:current_user].id)
      end
    end
  end
end