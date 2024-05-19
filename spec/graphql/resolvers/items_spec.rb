require 'rails_helper'

RSpec.describe Resolvers::Items, type: :request do
  describe '#resolve' do
    let!(:item1) { create(:item, label: 'Item 1', type: 'Component') }
    let!(:item2) { create(:item, label: 'Item 2', type: 'Product') }
    let!(:item3) { create(:item, label: 'Another Item', type: 'Component') }

    before { make_graphql_request(query:) }

    context 'when type and label are provided' do
      let(:query) do
        <<-GRAPHQL
          query {
            items(type: "Component", label: "Item 1") {
              label
              type
            }
          }
        GRAPHQL
      end

      it 'returns items with the specified type and label' do
        json_response = JSON.parse(response.body)
        items = json_response.dig("data", "items")

        expect(items.size).to eq(1)
        expect(items.first['label']).to eq('Item 1')
        expect(items.first['type']).to eq('Component')
      end
    end

    context 'when type and label are not provided' do
      let(:query) do
        <<-GRAPHQL
          query {
            items {
              label
              type
            }
          }
        GRAPHQL
      end

      it 'returns all items' do
        items = json_response['data']['items']

        expect(items.size).to eq(3) # Assuming we have 3 items created
      end
    end

    context 'when page and limit are provided' do
      let(:query) do
        <<-GRAPHQL
          query {
            items(page: 1, limit: 2) {
              label
              type
            }
          }
        GRAPHQL
      end

      it 'returns paginated items' do
        items = json_response['data']['items']

        expect(items.size).to eq(2)
      end
    end
  end
end
