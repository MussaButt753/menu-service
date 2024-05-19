require 'rails_helper'

RSpec.describe Mutations::UpdateItem, type: :request do
  describe '.resolve' do
    let(:item) { create(:item) }

    let(:mutation) do
      <<~GQL
        mutation($id: ID!, $price: Float, $label: String!, $type: String, $description: String) {
          updateItem(input: { id: $id, price: $price, label: $label, type: $type, description: $description }) {
            item {
              id
              price
              label
              type
              description
            }
          }
        }
      GQL
    end

    context 'when the request is valid' do
      it 'updates the item and returns the item details' do
        variables = {
          id: item.id.to_s,
          price: 29.99,
          label: 'Updated Label',
          type: 'Product',
          description: 'Updated Description'
        }

        make_graphql_request(query: mutation, variables:)

        data = json_response['data']['updateItem']['item']

        expect(data).to include(variables.with_indifferent_access)
      end
    end

    context 'when the request has invalid inputs' do
      it 'returns an error' do
        variables = {
          id: item.id.to_s,
          price: -10.0, # Invalid price
          label: 'Updated Label',
          type: 'Product',
          description: 'Updated Description'
        }

        make_graphql_request(query: mutation, variables:)

        expect(json_response['exception']).to eq(
          "#<ActiveRecord::RecordInvalid: Validation failed: Price must be greater than 0.0>"
        )
      end
    end
  end
end