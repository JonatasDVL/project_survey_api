module Resolvers
  module Responses
    class ResponseCountsByOption < Resolvers::BaseResolver
      
      type [Types::ResponseCountByOptionType], null: false

      def resolve
        Response.group(:selected_option_id).count.map do |selected_option_id, count|
          next unless selected_option_id

          option = Option.find(selected_option_id)
          OpenStruct.new(
            option_id: selected_option_id,
            option_text: option.text,
            question_id: option.question_id,
            question_text: option.question.text,
            count: count
          )
        end.compact
      end
    end
  end
end