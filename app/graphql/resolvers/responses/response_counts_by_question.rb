module Resolvers
  module Responses
    class ResponseCountsByQuestion < Resolvers::BaseResolver

      type [Types::ResponseCountByQuestionType], null: false

      def resolve
        # pra melhorar a performace
        questions = Question.where(id: Response.select(:question_id).distinct)
        question_map = questions.index_by(&:id)

        Response.group(:question_id).count.map do |question_id, count|
          question_text = question_map[question_id].text
          OpenStruct.new(question_id: question_id, count: count, question_text: question_text)
        end
      end
    end
  end
end