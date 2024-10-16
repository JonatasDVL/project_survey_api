module Types
  class ResponseCountByQuestionType < Types::BaseObject
    field :question_id, ID, null: false
    field :question_text, String, null: false
    field :count, Integer, null: false
  end
end