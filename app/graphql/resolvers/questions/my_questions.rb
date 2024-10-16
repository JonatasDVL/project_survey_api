module Resolvers
  module Questions
    class MyQuestions < Resolvers::BaseResolver

      type [Types::QuestionType], null: false

      def resolve
        user = context[:current_user]
        surveys = Survey.where(user_id: user.id)
        Question.where(survey_id: surveys.ids)
      end
    end
  end
end