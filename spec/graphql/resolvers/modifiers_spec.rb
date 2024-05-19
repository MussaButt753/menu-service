
require 'rails_helper'

RSpec.describe Resolvers::Modifiers, type: :request do
  describe '#resolve' do
    let!(:modifier1) { create(:modifier) }
    let!(:modifier2) { create(:modifier) }
    let!(:modifier3) { create(:modifier) }

    context 'when page and limit are provided' do
      it 'returns paginated modifiers' do
        query = <<-GRAPHQL
          query {
            modifiers(page: 1, limit: 2) {
              id
            }
          }
        GRAPHQL

        post '/graphql', params: { query: query }
        modifiers = json_response['data']['modifiers']

        expect(modifiers.size).to eq(2)
      end
    end

    context 'when page and limit are not provided' do
      it 'returns all modifiers' do
        query = <<-GRAPHQL
          query {
            modifiers {
              id
            }
          }
        GRAPHQL

        post '/graphql', params: { query: query }
        modifiers = json_response['data']['modifiers']

        expect(modifiers.size).to eq(Modifier.count)
      end
    end
  end
end