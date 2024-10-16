module Resolvers
  module Surveys
    class MyClosedSurveys < Resolvers::BaseResolver

      type [Types::SurveyType], null: false

      def resolve
        current_time = Time.current
        user_surveys = Survey.where(user_id: context[:current_user].id)
        user_surveys.where("start_date > ? or end_date < ?", current_time, current_time)
      end
    end
  end
end