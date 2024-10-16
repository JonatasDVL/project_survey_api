module Resolvers
  module Options
    class MyOptions < Resolvers::BaseResolver

      type [Types::OptionType], null: false

      def resolve
        user = context[:current_user]
        surveys = Survey.where(user_id: user.id)
        questions = Question.where(survey_id: surveys.ids)
        Option.where(question_id: questions.ids)
      end
    end
  end
end