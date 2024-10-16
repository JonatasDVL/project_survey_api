module Types
  class ResponseCountByOptionType < Types::BaseObject
    field :option_id, ID, null: false
    field :option_text, String, null: false
    field :question_id, ID, null: false
    field :question_text, String, null: false
    field :count, Integer, null: false
  end
end