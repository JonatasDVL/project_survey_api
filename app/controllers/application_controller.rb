class ApplicationController < ActionController::API
  before_action :authorize_request

  private

  def authorize_request
    return if create_user_mutation?

    header = request.headers['Authorization']
    header = header.split(' ').last if header
    decoded = JsonWebToken.decode(header)
    @current_user = User.find(decoded[:user_id]) if decoded
    render json: { errors: 'Unauthorized' }, status: :unauthorized unless @current_user
  rescue ActiveRecord::RecordNotFound, JWT::DecodeError
    render json: { errors: 'Unauthorized' }, status: :unauthorized
  end

  # def create_user_mutation?
  #   body = request.body.read
  #   request.body.rewind

  #   begin
  #     parsed_body = JSON.parse(body)
  #     graphql_query = parsed_body["query"] 

  #     graphql_query = graphql_query.gsub(/^#.*$/, '')

  #     graphql_query&.include?("createUser(input: {")
  #   rescue JSON::ParserError
  #     false 
  #   end
  # end

  def create_user_mutation?
    body = request.body.read
    request.body.rewind 

    begin
      parsed_body = JSON.parse(body) 
      graphql_query = parsed_body["query"]

      graphql_query = graphql_query.gsub(/^#.*$/, '')

      mutation_pattern = /createUser\(input:\s*\{/
      
      query_without_strings = graphql_query.gsub(/"(?:\\.|[^"\\])*"/, '')

      query_without_strings.match?(mutation_pattern)
    rescue JSON::ParserError
      false 
    end
  end

end
