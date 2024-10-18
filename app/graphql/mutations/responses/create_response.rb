# frozen_string_literal: true

module Mutations
  class Responses::CreateResponse < BaseMutation
    argument :question_id, String, required: true
    argument :selected_option_id, String, required: false
    argument :text_response, String, required: false
    
    field :response, Types::ResponseType, null: true
    field :errors, [String], null: false
    
    def resolve(**attributes)
      user = context[:current_user] 
      
      question = Question.find_by(id: attributes[:question_id])
      return { response: nil, errors: ["Question not found"] } if question.nil?
      
      survey = Survey.find_by(id: question.survey_id)
      return { response: nil, errors: ["Survey closed"] } if survey.start_date > Time.now and Time.now >= survey.end_date

      question_type = question.question_type
      selected_option_id = attributes[:selected_option_id]
      text_response = attributes[:text_response]
      selected_option = nil

      if question_type == 'multiple_choice' or question_type == 'checkbox'
        text_response = nil
        if selected_option_id.present?
          selected_option = Option.find_by(id: selected_option_id)
          return { response: nil, errors: ["Selected option not found"] } if selected_option.nil?
          if question_type == 'multiple_choice' and Response.exists?(user_id: user.id, question_id: question.id)
            return { response: nil, errors: ["A response has already been submitted for this question"] }
          elsif question_type == 'checkbox' and Response.exists?(user_id: user.id, question_id: question.id, selected_option_id: selected_option_id)
            return { response: nil, errors: ["This response has already been marked for this question"] }
          end      
        else
          return { response: nil, errors: ["A selected option is required for this question type"] }
        end
      elsif question_type == 'short_text' or question_type == 'long_text'
        if Response.exists?(user_id: user.id, question_id: question.id)
          return { response: nil, errors: ["A response has already been submitted for this question"] }
        end  
        selected_option = nil
        return { response: nil, errors: ["A text response is required for this question type"] } if text_response.blank?
      else
        return { response: nil, errors: ["Invalid question type"] }
      end

      if selected_option == nil and text_response == nil
        return { response: nil, errors: ["Response inconsistent with the type of question"] } 
      end


      response = Response.new(
        user: user,
        question_id: attributes[:question_id],
        selected_option: selected_option,
        text_response: text_response
      )

      if response.save
        { response: response, errors: [] }
      else
        { response: nil, errors: response.errors.full_messages }
      end
    end
  end
end