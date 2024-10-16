module Resolvers
  module Responses
    class MyResponses < Resolvers::BaseResolver

      type [Types::ResponseType], null: false

      def resolve
        Response.where(user_id: context[:current_user].id)
      end
    end
  end
end