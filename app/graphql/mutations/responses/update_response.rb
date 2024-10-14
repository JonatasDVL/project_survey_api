# frozen_string_literal: true

module Mutations
  class Responses::UpdateResponse < BaseMutation
    argument :id, String, required: true
    argument :selected_option_id, String, required: false
    argument :text_response, String, required: false
    
    field :response, Types::ResponseType, null: true
    field :errors, [String], null: false

    def resolve(**attributes)
      user = context[:current_user]
      response = Response.find_by(id: attributes[:id])

      if response.nil?
        return { response: nil, errors: ["Response not found"] }
      end

      if user.id != response.user_id
        return { response: nil, errors: ["Permission denied for update"] }
      end

      question = response.question
      question_type = question.question_type
      selected_option_id = attributes[:selected_option_id]
      text_response = attributes[:text_response]

      if question_type == 'multiple_choice' or question_type == 'checkbox'
        text_response = nil
        if selected_option_id.present?
          selected_option = Option.find_by(id: selected_option_id)
          return { response: nil, errors: ["Selected option not found"] } if selected_option.nil?
        else
          return { response: nil, errors: ["A selected option is required for this question type"] }
        end
      elsif question_type == 'short_text' or question_type == 'long_text'
        selected_option = nil
        return { response: nil, errors: ["A text response is required for this question type"] } if text_response.blank?
      else
        return { response: nil, errors: ["Invalid question type"] }
      end

      if selected_option == nil and text_response == nil
        return { response: nil, errors: ["Response inconsistent with the type of question"] } 
      end
      
      response.selected_option = selected_option
      response.text_response = text_response

      if response.save
        { response: response, errors: [] }
      else
        { response: nil, errors: response.errors.full_messages }
      end
    end
  end
end