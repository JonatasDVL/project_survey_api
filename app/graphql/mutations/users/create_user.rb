# frozen_string_literal: true

module Mutations
  class Users::CreateUser < BaseMutation
    argument :name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true
    argument :role, Integer, required: true
    
    field :user, Types::UserType, null: true
    field :errors, [String], null: false

    def resolve(**attributes)
      user = User.new(
        name: attributes[:name], 
        email: attributes[:email], 
        password: attributes[:password],
        role: attributes[:role]
        )
      if user.save 
        { user: user, errors: []}
      else
        { user: nil, errors: user.errors.full_messages}
      end
    end
  end
end
