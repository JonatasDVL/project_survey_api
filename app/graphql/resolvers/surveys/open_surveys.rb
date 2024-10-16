module Resolvers
  module Surveys
    class OpenSurveys < Resolvers::BaseResolver

      type [Types::SurveyType], null: false

      def resolve
        current_time = Time.current

        Survey.where("start_date <= ? AND end_date >= ?", current_time, current_time)
      end
    end
  end
end