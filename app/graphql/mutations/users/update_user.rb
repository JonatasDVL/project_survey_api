# frozen_string_literal: true

module Mutations
  class Users::UpdateUser < BaseMutation
    argument :id, String, required: true
    argument :name, String, required: false
    argument :email, String, required: false
    argument :password, String, required: false
    argument :role, Integer, required: false
    
    field :user, Types::UserType, null: true
    field :errors, [String], null: false

    def resolve(**attributes)
      user = context[:current_user] 

      user_confirmation = User.find_by(id: attributes[:id])
      
      if user_confirmation.nil?
        return { survey: nil, errors: ["User not found"] }
      end
      
      if user != user_confirmation
        return { survey: nil, errors: ["Permission denied for update"] }
      end

      user.name = attributes[:name] unless attributes[:name].nil?
      user.email = attributes[:email] unless attributes[:email].nil?
      user.password = attributes[:password] unless attributes[:password].nil?
      user.role = attributes[:role] unless attributes[:role].nil?

      if user.save 
        { user: user, errors: []}
      else
        { user: nil, errors: user.errors.full_messages}
      end
    end
  end
end
