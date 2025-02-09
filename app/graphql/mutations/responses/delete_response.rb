# frozen_string_literal: true

module Mutations
  class Responses::DeleteResponse < BaseMutation
    argument :id, String, required: true

    field :response, Types::ResponseType, null: true
    field :errors, [String], null: false

    def resolve(**attributes)
      user = context[:current_user] 
      response = Response.find_by(id: attributes[:id])
      
      if response.nil?
        return { response: nil, errors: ["Response not found"] }
      end

      question = Question.find_by(id: response.question_id)
      survey = Survey.find_by(id: question.survey_id)
      
      return { response: nil, errors: ["Survey closed"] } if survey.start_date > Time.now and Time.now >= survey.end_date
      
      owner_user = User.find_by(id: survey.user_id)

      user_confirmation = User.find_by(id: response.user_id)
      
      if user != user_confirmation and owner_user != user
        return { response: nil, errors: ["Permission denied for delete"] }
      end

      if response.destroy
        { response: response, errors: []}
      else
        { response: response, errors: response.errors.full_messages}
      end
    end
  end
end