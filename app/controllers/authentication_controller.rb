class AuthenticationController < ApplicationController
  skip_before_action :authorize_request

  def login
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: user.id)
      render json: { token: token }, status: :ok
    else
      render json: { error: 'Email ou senha Inválido' }, status: :unauthorized
    end
  end
end
