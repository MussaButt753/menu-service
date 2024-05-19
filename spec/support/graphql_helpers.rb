# frozen_string_literal: true

module GraphqlHelpers
  def make_graphql_request(query:, variables: {})
    post '/graphql',
          params: {
            query: query,
            variables: variables
          },
          as: :json
  end

  def json_response
    JSON.parse(response.body).with_indifferent_access
  end
end
