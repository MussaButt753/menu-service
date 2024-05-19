require 'rails_helper'

RSpec.describe Mutations::CreateItem, type: :request do
  describe '.resolve' do
    let(:mutation) do
      <<~GQL
        mutation($identifier: String!, $price: Float!, $label: String!, $type: String!, $description: String) {
          createItem(input: { identifier: $identifier, price: $price, label: $label, type: $type, description: $description }) {
            item {
              identifier
              price
              label
              type
              description
            }
          }
        }
      GQL
    end

    before { make_graphql_request(query: mutation, variables:) }
    context 'when the request is valid' do
      let(:variables) do
        {
          identifier: 'item-123',
          price: 19.99,
          label: 'Test Item',
          type: 'Product',
          description: 'This is a test item'
        }
      end

      it 'creates a new item and returns the item details' do
        data = json_response['data']['createItem']['item']

        expect(data).to include(
          'identifier' => 'item-123',
          'price' => 19.99,
          'label' => 'Test Item',
          'type' => 'Product',
          'description' => 'This is a test item'
        )
      end
    end

    context 'when the request is missing required fields' do
      let(:variables) do
        {
          identifier: 'item-123',
          price: 19.99,
          label: nil,
          type: 'Test Type',
          description: 'This is a test item'
        }
      end

      it 'returns an error' do
        errors = json_response['errors']

        expect(errors).not_to be_empty
        expect(errors.first['message']).to eq("Variable $label of type String! was provided invalid value")
      end
    end
  end
end