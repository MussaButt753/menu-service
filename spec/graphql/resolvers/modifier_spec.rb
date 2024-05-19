
require 'rails_helper'

RSpec.describe Resolvers::Modifier, type: :request do
  describe '#resolve' do
    let!(:modifier) { create(:modifier) }

    context 'when id is provided' do
      it 'returns the modifier with the specified id' do
        query = <<-GRAPHQL
          query {
            modifier(id: #{modifier.id}) {
              id
            }
          }
        GRAPHQL
        post '/graphql', params: { query: query }

        modifier_response = json_response['data']['modifier']

        expect(modifier_response['id'].to_i).to eq(modifier.id)
      end
    end

    context 'when id is not provided' do
      it 'raises an error' do
        query = <<-GRAPHQL
          query {
            modifier {
              id
            }
          }
        GRAPHQL

        post '/graphql', params: { query: query }
        errors = json_response['errors']

        expect(errors.size).to eq(1)
        expect(errors.first['message']).to eq("Field 'modifier' is missing required arguments: id")
      end
    end
  end
end
