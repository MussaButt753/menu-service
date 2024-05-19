
require 'rails_helper'

RSpec.describe Resolvers::Item, type: :request do
  describe '#resolve' do
    let!(:item) { create(:item) }

    before { make_graphql_request(query:) }

    context 'when id is provided' do
      let(:query) do
        <<-GRAPHQL
          query {
            item(id: #{item.id}) {
              id
              label
            }
          }
        GRAPHQL
      end

      it 'returns the item with the specified id' do
        item_response = json_response['data']['item']

        expect(item_response['id'].to_i).to eq(item.id)
      end
    end

    context 'when id is not provided' do
      let(:query) do
        <<-GRAPHQL
          query {
            item {
              id
            }
          }
        GRAPHQL
      end
      it 'raises an error' do
        errors = json_response['errors']

        expect(errors.size).to eq(1)
        expect(errors.first['message']).to eq("Field 'item' is missing required arguments: id")
      end
    end
  end
end
