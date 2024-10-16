module Helpers
  module AuthAdmHelper
    def admin_user?
      user = context[:current_user]
      user&.email == "admroot@gmail.com"
    end

    def authorize_admin!
      return if admin_user?

      raise GraphQL::ExecutionError, "Permission denied"
    end
  end
end