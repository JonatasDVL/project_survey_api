# frozen_string_literal: true

module Mutations
  class Users::DeleteUser < BaseMutation
    argument :id, String, required: true

    field :user, Types::UserType, null: true
    field :errors, [String], null: false

    def resolve(**attributes)
      user = context[:current_user] 

      user_confirmation = User.find_by(id: attributes[:id])
      
      if user_confirmation.nil?
        return { survey: nil, errors: ["User not found"] }
      end
      
      if user != user_confirmation
        return { survey: nil, errors: ["Permission denied for delete"] }
      end

      if user.destroy 
        { user: user, errors: []}
      else
        { user: user, errors: user.errors.full_messages}
      end
    end
  end
end
