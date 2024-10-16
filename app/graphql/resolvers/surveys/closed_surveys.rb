module Resolvers
  module Surveys
    class ClosedSurveys < Resolvers::BaseResolver

      type [Types::SurveyType], null: false

      def resolve
        current_time = Time.current

        Survey.where("start_date > ? or end_date < ?", current_time, current_time)
      end
    end
  end
end